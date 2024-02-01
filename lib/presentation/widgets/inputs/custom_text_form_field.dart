import 'package:core/context_extension.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.textController,
    required this.inputType,
    required this.inputAction,
    required this.labelText,
    super.key,
    this.onChanged,
    this.maxLength,
    this.isObscure,
    this.suffix,
    this.prefix,
    this.errorText,
  });

  final TextEditingController textController;
  final String? errorText;
  final Function? onChanged;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final String labelText;
  final int? maxLength;
  final bool? isObscure;
  final Widget? suffix;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      onChanged: (String? value) => onChanged ?? (String? val) {},
      textInputAction: inputAction,
      obscureText: isObscure ?? false,
      keyboardType: inputType,
      cursorColor: context.primaryColor,
      maxLength: maxLength,
      style: TextStyle(color: context.primaryColor, fontSize: context.fontSize14),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(13),
        isDense: true,
        isCollapsed: false,
        fillColor: context.whiteColor,
        filled: true,
        suffixIcon: suffix,
        prefixIcon: prefix,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: context.borderRadiusLow,
          borderSide: BorderSide(
            color: context.primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: context.borderRadiusLow,
          borderSide: BorderSide(
            color: context.primaryColor,
            width: context.gapPaddingVeryLow,
          ),
        ),
        errorBorder: OutlineInputBorder(
          gapPadding: context.gapPaddingNormal,
          borderRadius: context.borderRadiusLow,
          borderSide: BorderSide(
            color: context.errorColor,
            width: context.gapPaddingVeryLow,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          gapPadding: context.gapPaddingNormal,
          borderRadius: context.borderRadiusLow,
          borderSide: BorderSide(
            color: context.errorColor,
            width: context.gapPaddingVeryLow,
          ),
        ),
        errorText: errorText,
        errorMaxLines: maxLength != null ? 2 : 1,
        labelText: labelText,
        labelStyle: TextStyle(color: context.textColor, fontSize: context.fontSize14),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
