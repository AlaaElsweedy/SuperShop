import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:supershop/core/services/service_locator.dart';
import 'package:supershop/core/utils/token_secure_storage.dart';
import 'package:supershop/general/localization/initial_localization.dart';
import 'package:supershop/register/presentation/screens/home_screen.dart';
import 'package:supershop/register/presentation/screens/on_boarding_screen.dart';
import 'core/helpers/dio_helper.dart';
import 'core/utils/app_string.dart';
import 'core/utils/styles/app_themes/light_theme.dart';
import 'register/presentation/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  ServiceLocator.init();

  await EasyLocalization.ensureInitialized();

  Widget startWidget;
  String? token = await TokenSecureStorage.readSecureToken();
  print('token in home screen:/// $token');
  if (token == null) {
    startWidget = const OnBoardingScreen();
  } else {
    startWidget = HomeScreen();
  }

  runApp(
    initialLocalization(
        child: MyApp(
      startWidget: startWidget,
    )),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({
    super.key,
    required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: LightTheme.lightTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: startWidget,
    );
  }
}
