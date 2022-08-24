import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supershop/core/utils/constance.dart';
import 'package:supershop/core/utils/token_secure_storage.dart';
import 'package:supershop/home/presentation/screens/home_screen.dart';
import 'package:supershop/register/presentation/screens/login_screen.dart';
import 'package:supershop/register/presentation/screens/on_boarding_screen.dart';

Future<Widget> startScreen() async {
  Widget startWidget;
  final prefs = await SharedPreferences.getInstance();
  Object? onBoardingSeen = prefs.get('isOnBoardingSeen');

  token = await TokenSecureStorage.readSecureToken();
  print('Main token $token');

  if (token == null) {
    if (onBoardingSeen == null) {
      startWidget = const OnBoardingScreen();
    } else {
      startWidget = LoginScreen();
    }
  } else {
    startWidget = const HomeScreen();
  }
  return startWidget;
}
