import 'package:flutter/material.dart';
import 'package:sayaraty/config/colors/app_colors.dart';
import 'package:sayaraty/config/themes/font_weight.dart';
import 'package:sayaraty/core/helpers/spacing.dart';
import 'package:sayaraty/core/methods/get_responsive_text/responsive_text.dart';

class UserInputFeild extends StatelessWidget {
  const UserInputFeild({
    super.key,
    required this.controller,
    required this.hintText,
    required this.titleText,
    this.isPassword,
    this.icon,
    this.onTap,
  });

  final TextEditingController controller;
  final String hintText;
  final String titleText;
  final bool? isPassword;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: getResponsiveFontSize(context, fontSize: 16),
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        Spacing.verticalSpace(5),
        Container(
          padding: EdgeInsets.only(left: 15, top: 3, bottom: 3),
          decoration: BoxDecoration(
            color: AppColors.kFormFeildColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            obscureText: isPassword!,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              suffixIcon: IconButton(
                onPressed: onTap,
                icon: Icon(icon, size: 22, color: AppColors.kGrayColor),
              ),

              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: getResponsiveFontSize(context, fontSize: 16),
                fontWeight: FontWeightHelper.regular,
                color: AppColors.kGrayColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
