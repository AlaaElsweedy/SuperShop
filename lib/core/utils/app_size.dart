import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSize {
  static sizedBox28(BuildContext context) =>
      SizedBox(height: MediaQuery.of(context).size.height / 20);

  static sizedBox20(BuildContext context) =>
      SizedBox(height: MediaQuery.of(context).size.height / 40);

  static SizedBox sizedBox15(BuildContext context) =>
      SizedBox(height: MediaQuery.of(context).size.height / 40);

  static SizedBox sizedBox10(BuildContext context) =>
      SizedBox(height: MediaQuery.of(context).size.height / 60);

  static SizedBox sizedBox5(BuildContext context) =>
      SizedBox(height: MediaQuery.of(context).size.height / 100);

  static SizedBox sizedBoxW10(BuildContext context) =>
      SizedBox(width: MediaQuery.of(context).size.width / 60);

  static SizedBox sizedBoxW5(BuildContext context) =>
      SizedBox(width: MediaQuery.of(context).size.width / 80);

  static EdgeInsets paddingAll10 = EdgeInsets.all(10.r);

  static EdgeInsets paddingAll20 = EdgeInsets.all(20.r);

  static EdgeInsets paddingHorizontal5 = EdgeInsets.symmetric(horizontal: 5.w);

  static EdgeInsets paddingHorizontal10 =
      EdgeInsets.symmetric(horizontal: 10.w);

  static EdgeInsets paddingHorizontal20 =
      EdgeInsets.symmetric(horizontal: 20.w);
}
