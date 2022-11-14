import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/styles/app_colors.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.borderColor,
      height: 1.h,
      width: double.infinity,
    );
  }
}

class MyVerticalDivider extends StatelessWidget {
  const MyVerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 2.w,
      color: MediaQuery.of(context).platformBrightness == Brightness.dark
          ? AppColors.backgroundColorLight
          : AppColors.productGridViewColorLight,
    );
  }
}
