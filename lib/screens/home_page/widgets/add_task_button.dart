import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class AddButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget buttonIcon;
  const AddButton(
      {super.key, required this.onPressed, required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(150, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          backgroundColor: AppColors.buttonColor),
      onPressed: onPressed,
      label: const Text(
        "Add",
      ),
      icon: buttonIcon,
    );
  }
}
