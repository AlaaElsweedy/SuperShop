import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class DarkTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 20.0.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.normalTextWitheColor,
      ),
      backgroundColor: AppColors.backgroundColorDark,
      actionsIconTheme: const IconThemeData(
        color: AppColors.primaryColorDark,
      ),
      iconTheme: const IconThemeData(color: AppColors.iconColorLight),
      elevation: 0.0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundColorDark,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.backgroundColorDark,
    ),
    colorScheme: ColorScheme.fromSwatch(
      accentColor: AppColors.greyBackgroundColorDark,
    ),
    primaryColor: AppColors.primaryColorDark,
    backgroundColor: AppColors.backgroundColorDark,
    scaffoldBackgroundColor: AppColors.backgroundColorDark,
    iconTheme: const IconThemeData(color: AppColors.primaryColorDark),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryColorDark,
      refreshBackgroundColor: AppColors.backgroundProgressIndicatorColorDark,
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        color: AppColors.normalTextWitheColor,
        fontSize: 28.0.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: AppColors.normalTextWitheColor,
        fontSize: 13.0.sp,
      ),
      bodyLarge: TextStyle(
        color: AppColors.normalTextWitheColor,
        fontSize: 22.0.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColors.normalTextWitheColor,
        fontSize: 18.0.sp,
      ),
      bodySmall: TextStyle(
        color: AppColors.normalTextWitheColor,
        fontSize: 18.0.sp,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontSize: 19.sp,
        color: AppColors.primaryColorDark,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontSize: 16.sp,
        color: AppColors.normalTextWitheColor,
        decoration: TextDecoration.lineThrough,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColorDark,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColorDark,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColorDark,
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.primaryColorDark,
      contentPadding: EdgeInsets.symmetric(
        vertical: 20.0.h,
        horizontal: 25.0.w,
      ),
      hintStyle: const TextStyle(
        color: AppColors.textHintColorDark,
      ),
      filled: true,
      prefixIconColor: AppColors.iconColorDark,
      fillColor: AppColors.greyBackgroundColorDark,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.r),
        borderSide: const BorderSide(
          color: AppColors.borderColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.r),
        borderSide: const BorderSide(
          color: AppColors.borderColor,
        ),
      ),
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: AppColors.cursorColorLight),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.bottomNavBackgroundColorLight,
      selectedItemColor: AppColors.selectedItemNavBarColorLight,
      unselectedItemColor: AppColors.unSelectedItemNavBarColorLight,
    ),
  );
}
