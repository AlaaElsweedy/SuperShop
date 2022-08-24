
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
        titleMedium: TextStyle(
          color: AppColors.mediumTextColorLight,
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          color: AppColors.smallTextColorLight,
          fontSize: 13.0,
        ),
        bodyMedium: TextStyle(
          color: AppColors.primaryFontColor,
          fontSize: 18.0,
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
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
        hintStyle: const TextStyle(
          color: AppColors.textFiledHintColorLight,
        ),
        filled: true,
        fillColor: AppColors.textFiledFillColorLight,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.textFiledFillColorLight,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.textFiledFillColorLight,
          ),
        ),

        //prefixIconColor: AppColors.lightThemeTextFieldBorderColor,
        // suffixIconColor: AppColors.lightThemeTextFieldBorderColor,
      ),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.cursorColorLight));
}
