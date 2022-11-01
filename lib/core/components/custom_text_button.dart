import 'package:flutter/material.dart';
import '../utils/styles/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String child;
  final double fontSize;
  final VoidCallback onPressed;
  final FontWeight fontWeight;

  const CustomTextButton({
    Key? key,
    this.fontWeight = FontWeight.bold,
    required this.onPressed,
    required this.child,
    this.fontSize = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        child,
        style: TextStyle(
          fontSize: fontSize,
          color: AppColors.primaryColorLight,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
