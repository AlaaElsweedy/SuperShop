import 'package:flutter/material.dart';
import 'package:supershop/core/utils/app_size.dart';
import '../utils/styles/app_colors.dart';

class CustomRowButton extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final VoidCallback onPressed;
  final Color textColor;
  final double width;
  final double height;
  final IconData icon;

  const CustomRowButton({
    Key? key,
    this.backgroundColor = AppColors.primaryColorLight,
    required this.title,
    this.textColor = AppColors.normalTextWitheColorLight,
    this.width = double.infinity,
    this.height = 56,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: backgroundColor,
      textColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      height: height,
      minWidth: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          AppSize.sizedBoxW5,
          Text(title),
        ],
      ),
    );
  }
}
