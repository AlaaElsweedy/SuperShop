import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_size.dart';

class CustomRowButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final IconData icon;

  const CustomRowButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    this.height = 56,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r),
      ),
      height: height.h,
      minWidth: width.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          AppSize.sizedBoxW10(context),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
