import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/styles/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 56.0,
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
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.normalTextWitheColor,
          fontSize: 20.sp,
        ),
      ),
    );
  }
}
