import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon prefixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String validatorMessage;
  final Color prefixIconColor;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.obscureText,
    this.keyboardType,
    required this.prefixIcon,
    required this.hintText,
    required this.validatorMessage,
    this.prefixIconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        keyboardAppearance: Brightness.dark,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorMessage;
          }
          return null;
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3),
            borderRadius: BorderRadius.circular(15),
          ),
          prefixIconColor: Colors.black,
          hintStyle: AppTextStyles.title,
          fillColor: const Color(0xFF111723),
          prefixIcon: prefixIcon,
          hintText: hintText,
        ),
      ),
    );
  }
}
