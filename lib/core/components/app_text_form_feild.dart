import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/colors/app_colors.dart';
import '../methods/get_responsive_text/responsive_text.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.formFieldKey,
    this.isPassword,
    this.type,
    this.controller,
    this.validate,
    this.onTap,
    this.suffixIcon,
    this.suffixPressed,
    this.edgeInsetsGeometry,
    this.hint,
    this.onChanged,
    this.onSubmitted,
    this.prefixIcon,
    this.labelStyle,
    this.hintStyle,
    this.maxLine,
    this.minLine,
    this.isEnable,
    this.scrollController,
    this.autofocus,
    this.focusNode,
    this.floatingLabelBehavior,
    this.hintTextDirection,
    this.hintMaxLines,
    this.onSaved,
    this.label,
    this.unFocusBorderColor,
    this.focusColorBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.border,
    this.fillColor,
    this.errorBorder,
    this.focusedErrorBorder,
    this.prefixColor,
    this.suffixIconColor,
    this.fill,
  });

  final ScrollController? scrollController;
  final bool? isPassword;
  final bool? autofocus;
  final TextInputType? type;
  final TextEditingController? controller;
  final String? Function(String?)? onSubmitted;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? validate;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onTap;
  final VoidCallback? suffixPressed;
  final EdgeInsetsGeometry? edgeInsetsGeometry;
  final String? label;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool? isEnable;
  final int? maxLine;
  final int? minLine;
  final FocusNode? focusNode;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextDirection? hintTextDirection;
  final int? hintMaxLines;
  final Key? formFieldKey;
  final Color? unFocusBorderColor;
  final Color? focusColorBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? border;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Color? fillColor;
  final Color? prefixColor;
  final Color? suffixIconColor;
  final bool? fill;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.formFieldKey,
      scrollController: widget.scrollController,
      obscureText: widget.isPassword ?? false,
      keyboardType: widget.type,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: getResponsiveFontSize(context, fontSize: 15.sp),
      ),
      controller: widget.controller,
      onFieldSubmitted: widget.onSubmitted,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      validator: widget.validate,
      maxLines: widget.maxLine ?? 1,
      minLines: widget.minLine,
      onTap: widget.onTap,
      enabled: widget.isEnable,
      focusNode: _focusNode,
      decoration: InputDecoration(
        fillColor: widget.fillColor,
        filled: widget.fill ?? false,
        isDense: true,
        hintTextDirection: widget.hintTextDirection,
        hintMaxLines: widget.hintMaxLines,
        helperStyle: const TextStyle(
          decorationStyle: TextDecorationStyle.dotted,
        ),
        contentPadding:
            widget.edgeInsetsGeometry ??
            EdgeInsets.symmetric(horizontal: 10.w, vertical: 17.h),
        prefixIcon: Icon(
          widget.prefixIcon,
          size: 20,
          color: widget.prefixColor ?? Theme.of(context).iconTheme.color,
        ),
        focusedBorder:
            widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: widget.focusColorBorder ?? AppColors.kPrimaryColor,
              ),
            ),
        enabledBorder:
            widget.enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: widget.unFocusBorderColor!),
            ),
        errorBorder:
            widget.errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(color: Colors.red),
            ),
        focusedErrorBorder:
            widget.focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(color: Colors.red),
            ),
        hintText: widget.hint,
        labelText: widget.label ?? '',
        suffixIcon:
            widget.suffixIcon != null
                ? GestureDetector(
                  onTap: widget.suffixPressed,
                  child: Icon(
                    widget.suffixIcon,
                    color: widget.suffixIconColor ?? AppColors.kHintTextColor,
                    size: 25,
                  ),
                )
                : null,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        floatingLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: _isFocused ? AppColors.kPrimaryColor : Colors.grey,
        ),
      ),
      cursorColor: AppColors.kPrimaryColor,
    );
  }
}
