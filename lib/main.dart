import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:supershop/features/register/presentation/screens/login_screen.dart';
import 'package:supershop/localization/localization_service.dart';

import 'core/helpers/dio_helper.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_string.dart';
import 'core/utils/startScreen.dart';
import 'core/utils/styles/app_themes/light_theme.dart';
import 'core/utils/token_secure_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  ServiceLocator.init();

  await EasyLocalization.ensureInitialized();

  Widget startWidget = await startScreen();

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
