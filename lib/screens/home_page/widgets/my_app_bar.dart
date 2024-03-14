import 'package:flutter/material.dart';
import 'package:task2_todoapp/constants/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? logo;
  final Widget appBarText;
  final Widget? trailing;

  const MyAppBar(
      {super.key, this.logo, required this.appBarText, this.trailing});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.appColor,
      leading: logo,
      title: appBarText,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: trailing,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 60);
}
