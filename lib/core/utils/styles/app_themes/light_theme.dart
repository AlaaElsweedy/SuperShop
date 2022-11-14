import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class LightTheme {
  static final lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 20.0.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.appBarTitleColorLight,
      ),
      backgroundColor: AppColors.backgroundColorLight,
      actionsIconTheme: const IconThemeData(
        color: AppColors.primaryColorLight,
      ),
      iconTheme: const IconThemeData(color: AppColors.iconColorLight),
      elevation: 0.0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundColorLight,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.backgroundColorLight,
    ),
    colorScheme: ColorScheme.fromSwatch(
      accentColor: AppColors.accentColorLight,
    ),
    primaryColor: AppColors.primaryColorLight,
    backgroundColor: AppColors.backgroundColorLight,
    scaffoldBackgroundColor: AppColors.backgroundColorLight,
    primaryIconTheme: const IconThemeData(color: AppColors.iconColorLight),
    iconTheme: const IconThemeData(color: AppColors.iconColorLight),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryColorLight,
      refreshBackgroundColor: AppColors.backgroundProgressIndicatorColorLight,
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        color: AppColors.mediumTextColorLight,
        fontSize: 28.0.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: AppColors.smallTextColorLight,
        fontSize: 13.0.sp,
      ),
      bodyLarge: TextStyle(
        color: AppColors.mediumTextColorLight,
        fontSize: 22.0.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColors.mediumTextColorLight,
        fontSize: 18.0.sp,
      ),
      bodySmall: TextStyle(
        color: AppColors.mediumTextColorLight,
        fontSize: 18.0.sp,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontSize: 19.sp,
        color: AppColors.normalTextRedColorLight,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontSize: 16.sp,
        color: AppColors.mediumTextColorLight,
        decoration: TextDecoration.lineThrough,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColorLight,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColorLight,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColorLight,
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColorLight,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.iconTextFiledColorLight,
      contentPadding: EdgeInsets.symmetric(
        vertical: 20.0.h,
        horizontal: 25.0.w,
      ),
      hintStyle: const TextStyle(
        color: AppColors.textHintColorLight,
      ),
      filled: true,
      prefixIconColor: AppColors.iconColorLight,
      fillColor: AppColors.textFiledFillColorLight,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.r),
        borderSide: const BorderSide(
          color: AppColors.textFiledFillColorLight,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.r),
        borderSide: const BorderSide(
          color: AppColors.textFiledFillColorLight,
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
