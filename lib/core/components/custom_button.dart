import 'package:flutter/material.dart';
import '../utils/styles/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onPressed;
  final Color textColor;
  final double width;
  final double height;

  const CustomButton({
    Key? key,
    this.color = AppColors.primaryColorLight,
    required this.title,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 56,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      textColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      height: height,
      minWidth: width,
      child: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
