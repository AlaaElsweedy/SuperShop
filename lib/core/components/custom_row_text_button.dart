import 'package:flutter/material.dart';
import 'package:supershop/core/utils/app_size.dart';

class CustomRowTextButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  const CustomRowTextButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 18,
          ),
          AppSize.sizedBoxW5,
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
