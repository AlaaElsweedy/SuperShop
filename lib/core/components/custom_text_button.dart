import 'package:flutter/material.dart';
import '../utils/styles/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final double fontSize;
  final VoidCallback onPressed;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry? padding;
  final Size? size;
  final MaterialTapTargetSize? tapTargetSize;

  const CustomTextButton({
    Key? key,
    this.fontWeight = FontWeight.bold,
    required this.onPressed,
    required this.title,
    this.titleColor = AppColors.primaryColorLight,
    this.fontSize = 15,
    this.padding,
    this.size,
    this.tapTargetSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding,
        minimumSize: Size.zero,
        tapTargetSize: tapTargetSize,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          color: titleColor,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
