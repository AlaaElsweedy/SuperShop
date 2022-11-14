import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'helpers/cache_helper.dart';
import 'helpers/dio_helper.dart';
import 'services/service_locator.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/register/presentation/screens/on_boarding_screen.dart';
import '../features/register/presentation/screens/login_screen.dart';
import 'utils/constance.dart';
import 'helpers/token_secure_storage_helper.dart';

Future<Widget> startScreen({
  required bool isDark,
}) async {
  DioHelper.init();
  ServiceLocator.init();

  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();
  token = await TokenSecureStorageHelper.readSecureToken();

  String? onBoardingSeen = CacheHelper.getData(key: 'isOnBoardingSeen');
  final Widget startWidget;

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
