import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supershop/features/home/presentation/screens/home_screen.dart';
import 'package:supershop/features/register/presentation/screens/on_boarding_screen.dart';
import 'package:supershop/features/register/presentation/screens/login_screen.dart';
import 'constance.dart';
import 'token_secure_storage.dart';

Future<Widget> startScreen() async {
  Widget startWidget;
  final prefs = await SharedPreferences.getInstance();
  Object? onBoardingSeen = prefs.get('isOnBoardingSeen');

  token = await TokenSecureStorage.readSecureToken();
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
