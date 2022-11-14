import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final BuildContext context;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final TextInputType type;
  final bool isPassword;
  final bool autoFocus;
  final Icon prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixPressed;
  final Function(String)? onChange;
  const CustomTextFormField({
    Key? key,
    required this.context,
    required this.hintText,
    required this.validator,
    required this.controller,
    required this.type,
    this.isPassword = false,
    this.autoFocus = false,
    required this.prefixIcon,
    this.suffixIcon,
    this.suffixPressed,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      validator: validator,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onChanged: onChange,
      autofocus: autoFocus,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffixIcon!,
                ),
              )
            : null,
      ),
    );
  }
}
