import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';
import '../../data/models/country_model.dart';
import '../../logic/sign_up_cubit.dart';

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({super.key});

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  // List containing only Egypt as the option
  final List<CountryModel> countries = [
    CountryModel(name: 'Egypt', code: 'EG', flag: '🇪🇬'),
  ];

  // Initial selected country index
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().phoneFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildCountryDropdown(),
          _buildPhoneNumberField(context),
          Spacing.verticalSpace(20),
          _buildPrivacyAgreementText(context),
        ],
      ),
    );
  }

  // Builds the custom dropdown for selecting the country
  Widget _buildCountryDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kGrayColor),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: selectedIndex,
          icon: const Icon(Icons.arrow_drop_down),
          isExpanded: true,
          items: List.generate(countries.length, (index) {
            final country = countries[index];
            return DropdownMenuItem<int>(
              value: index,
              child: Row(
                children: [
                  Text(country.flag ?? ''),
                  const SizedBox(width: 8),
                  Text(
                    '${country.name} (${country.code})',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                  ),
                ],
              ),
            );
          }),
          onChanged: (value) {
            setState(() {
              selectedIndex = value!;
            });
          },
        ),
      ),
    );
  }

  // Builds the phone number input field
  Widget _buildPhoneNumberField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.phoneNumber,
        focusedBorder: _buildInputBorder(AppColors.kGrayColor),
        enabledBorder: _buildInputBorder(AppColors.kGrayColor),
        errorBorder: _buildInputBorder(AppColors.kRedColor),
        focusedErrorBorder: _buildInputBorder(AppColors.kRedColor),
        border: _buildInputBorder(AppColors.kGrayColor),
      ),
      keyboardType: TextInputType.phone,
      controller: context.read<SignUpCubit>().phoneController,
      validator: (value) {
        if (value!.isEmpty) {
          return AppLocalizations.of(context)!.phoneEmpty;
        } else if (!AppRegex.isPhoneNumberValid(value)) {
          return AppLocalizations.of(context)!.phoneValidation;
        }
        return null;
      },
    );
  }

  // Builds the border style for the input fields
  OutlineInputBorder _buildInputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
      borderSide: BorderSide(color: borderColor),
    );
  }

  // Builds the privacy agreement text
  Widget _buildPrivacyAgreementText(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.privacyAgreement,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeightHelper.semiBold,
        fontSize: getResponsiveFontSize(context, fontSize: 16),
      ),
    );
  }
}
