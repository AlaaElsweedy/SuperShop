import 'package:flutter/material.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: 1,
      width: double.infinity,
    );
  }
}

class MyVerticalDivider extends StatelessWidget {
  const MyVerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 2,
      color: AppColors.productGridViewColorLight,
    );
  }
}
