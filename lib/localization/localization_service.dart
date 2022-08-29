import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../generated/codegen_loader.g.dart';

Widget initialLocalization({required Widget child}) {
  return EasyLocalization(
    supportedLocales: const [
      Locale('en'),
      //Locale('ar'),
    ],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    assetLoader: const CodegenLoader(),
    child: child,
  );
}
