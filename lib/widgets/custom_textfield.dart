import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final int? maxLines;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Color? fillColor;
  final bool? isRequired;
  final EdgeInsetsGeometry? contentPadding;
  final String? labelText;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.validator,
    this.inputFormatters,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.fillColor,
    this.isRequired = true,
    this.contentPadding,
    this.labelText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      maxLines: maxLines,
      validator: validator,
      inputFormatters: inputFormatters,
      cursorColor: AppColor().primaryColor,
      cursorWidth: 1.5,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: context.isPhone ? 16 : 18,
          fontFamily: AppFontStyle().fontebold,
          color: AppColor().greyText,
        ),
        label: labelText != null
            ? RichText(
                text: TextSpan(
                  text: labelText,
                  style: TextStyle(
                    fontSize: context.isPhone ? 14 : 16,
                    color: Theme.of(context).hoverColor.withOpacity(0.5),
                  ),
                  children: [
                    TextSpan(
                      text: isRequired! ? '*' : '',
                      style: TextStyle(
                        color: AppColor().primaryColor,
                        fontSize: context.isPhone ? 16 : 18,
                      ),
                    ),
                  ],
                ),
              )
            : null,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 14),
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(color: Colors.transparent),
            ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor().primaryColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor().primaryColor, width: 2),
        ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(color: Colors.transparent, width: 1.5),
            ),
        focusedErrorBorder: focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(color: Colors.transparent, width: 1.5),
            ),
        errorStyle: TextStyle(
          color: AppColor().errorColor,
          fontSize: Get.context!.isPhone ? 12 : 14,
        ),
        filled: fillColor != null,
        fillColor: fillColor ?? Theme.of(context).cardColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
    );
  }
}
