import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_colors.dart';

class LightTheme {
  static final lightTheme = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundColorLight,
        actionsIconTheme: IconThemeData(
          color: AppColors.primaryColorLight,
        ),
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          //For Android
          statusBarColor: AppColors.backgroundColorLight,
          //For apps with a dark background:
          // For Android (light icons)
          statusBarIconBrightness: Brightness.dark,
          // For iOS (light icons)
          statusBarBrightness: Brightness.light,
        ),
      ),
      scaffoldBackgroundColor: AppColors.backgroundColorLight,
      primaryColor: AppColors.primaryColorLight,
      // colorScheme: const ColorScheme.light().copyWith(
      //   primary: AppColors.lightThemePrimary,
      //   secondary: AppColors.accentColor,
      // ),
      //iconTheme: const IconThemeData(color: AppColors.iconColorLight),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primaryColorLight,
        //disabledColor: AppColors.grey,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: AppColors.mediumTextColorLight,
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
          color: AppColors.smallTextColorLight,
          fontSize: 13.0,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColorLight,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              color: AppColors.primaryColorLight,
            ),
          ),
        ),
        // hintColor: AppColors.lightThemeTextFieldHintColor,
        // textSelectionTheme: const TextSelectionThemeData(
        //   cursorColor: AppColors.lightThemeTextFieldCursorColor,
        // ),
        // inputDecorationTheme: const InputDecorationTheme(
        //   fillColor: AppColors.lightThemeTextFieldFillColor,
        //   prefixIconColor: AppColors.lightThemeTextFieldBorderColor,
        //   suffixIconColor: AppColors.lightThemeTextFieldBorderColor,
        //   border: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       color: AppColors.lightThemeTextFieldBorderColor,
        //     ),
        //   ),
        //   enabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       color: AppColors.lightThemeTextFieldBorderColor,
        //     ),
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       color: AppColors.lightThemeTextFieldFocusedBorderColor,
        //       width: 1.5,
        //     ),
        //   ),
        //   errorBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       color: AppColors.lightThemeTextFieldErrorBorderColor,
        //     ),
        //   ),
        //   errorStyle: TextStyle(
        //     color: AppColors.lightThemeTextFieldValidationColor,
        //   ),
      ));
}
