import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:supershop/core/utils/app_string.dart';
import '../core/utils/styles/app_colors.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (route) => false,
  );
}

class CustomTextFormField extends StatelessWidget {
  final BuildContext context;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final TextInputType type;
  final bool isPassword;
  const CustomTextFormField({
    Key? key,
    required this.context,
    required this.hintText,
    required this.validator,
    required this.controller,
    required this.type,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      validator: validator,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}

class BuildHeader extends StatelessWidget {
  final String title;

  const BuildHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

class BuildSecondHeader extends StatelessWidget {
  final String title;
  final double? fontSize;
  final TextAlign? textAlign;

  const BuildSecondHeader({
    Key? key,
    required this.title,
    this.fontSize,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String child;
  final VoidCallback onPressed;
  final FontWeight fontWeight;

  const CustomTextButton({
    Key? key,
    this.fontWeight = FontWeight.bold,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        child,
        style: TextStyle(
          color: AppColors.primaryColorLight,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

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
      child: Text(title),
    );
  }
}
