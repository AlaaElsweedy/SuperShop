import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supershop/core/helpers/cache_helper.dart';
import 'package:supershop/core/helpers/dio_helper.dart';
import 'package:supershop/core/services/service_locator.dart';
import 'package:supershop/features/home/presentation/screens/home_screen.dart';
import 'package:supershop/features/register/presentation/screens/on_boarding_screen.dart';
import 'package:supershop/features/register/presentation/screens/login_screen.dart';
import 'constance.dart';
import 'token_secure_storage.dart';

Future<Widget> startScreen({
  required Widget startWidget,
  required bool isDark,
  Object? onBoardingSeen,
}) async {
  DioHelper.init();
  ServiceLocator.init();

  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();
  token = await TokenSecureStorage.readSecureToken();

  onBoardingSeen = CacheHelper.getData(key: 'isOnBoardingSeen');
  isDark = CacheHelper.getData(key: 'isDark');
  //print('Main token $token');

  if (token == null) {
    if (onBoardingSeen == null) {
      startWidget = const OnBoardingScreen();
    } else {
      startWidget = LoginScreen();
    }
  } else {
    startWidget = HomeScreen();
  }

  return startWidget;
}
