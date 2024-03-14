import 'package:flutter/material.dart';
import 'package:task2_todoapp/constants/colors.dart';

class TaskInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefix;
  final Widget? suffix;
  final String hintText;

  //m7atenash decoration 34an msh bn8yaro lkol input field
  // ya n7ot default value aw n5aleha nullable?

  const TaskInputField({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefix,
    this.suffix,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.inputFieldColor,
          enabledBorder: _getBorder(color: AppColors.inputFieldColor),
          focusedBorder: _getBorder(color: AppColors.inputFieldColor),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: prefix,
          ),
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 35, maxWidth: 35),
          suffixIcon: suffix,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
            // fontWeight: FontWeight.w600,
          )),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }

  InputBorder _getBorder({Color color = Colors.black}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: color,
      ),
      borderRadius: BorderRadius.circular(100),
    );
  }
}
