// ignore_for_file: inference_failure_on_function_return_type

import 'package:core/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    required this.onChanged,
    required this.mapList,
    required this.labelText,
    super.key,
    this.selectedValue,
    this.emptyMsg,
    this.decoration,
    this.errorText,
  });

  final String? selectedValue;
  final String? emptyMsg;
  final String? errorText;

  final String labelText;
  final Function(String? val) onChanged;
  final BoxDecoration? decoration;
  final List<DropdownMenuItem<String>> mapList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.poppins(
            fontSize: context.fontSize11,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            textStyle: TextStyle(
              color: context.primaryColor,
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintStyle: TextStyle(color: context.primaryColor, fontSize: context.fontSize12),
            isDense: false,
            filled: true,
            errorText: errorText,
            fillColor: context.whiteColor,
            focusColor: context.errorColor,
            labelStyle: TextStyle(color: context.primaryColor, fontSize: context.fontSize12),
            helperStyle: TextStyle(color: context.primaryColor, fontSize: context.fontSize12),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: context.primaryColor,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: context.primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: context.primaryColor,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              gapPadding: 8,
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: context.errorColor,
                width: 2,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          iconEnabledColor: context.primaryColor,
          iconDisabledColor: context.errorColor,
          dropdownColor: context.whiteColor,
          focusColor: context.whiteColor,
          style: TextStyle(color: context.primaryColor, fontSize: context.fontSize12),
          validator: (value) => value == null ? emptyMsg : null,
          value: selectedValue,
          onChanged: onChanged,
          items: mapList,
        ),
      ],
    );
  }
}
