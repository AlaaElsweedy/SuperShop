// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "skip": "تخطي",
  "next": "التالي",
  "previous": "السابق",
  "finish": "إنهاء",
  "signInToYourAccount": "قم بتسجيل الدخول إلى حسابك",
  "signIn": "تسجيل الدخول",
  "sign_up": "تسجيل",
  "email": "البريد الإلكتروني",
  "password": "الرقم السري",
  "phone": "رقم الهاتف",
  "explore": "استكشف",
  "explore_body": "اختر أي منتج تريده بأسهل طريقة ممكنة",
  "shipping": "الشحن",
  "payment": "الدفع",
  "shipping_body": "سيتم شحن طلبك إليك في أسرع وقت ممكن من قبل شركة الشحن الخاصة بك",
  "payment_body": "ادفع بأكثر الطرق أمانًا سواء نقدًا أو ببطاقات الائتمان",
  "full_name": "الاسم بالكامل",
  "have_account": "ليس لديك حساب؟"
};
static const Map<String,dynamic> en = {
  "skip": "Skip",
  "next": "Next",
  "previous": "Previous",
  "finish": "Finish",
  "signInToYourAccount": "Sign in to your account",
  "signIn": "SIGN IN",
  "sign_up": "SIGN UP",
  "full_name": "Full Name",
  "email": "Email",
  "password": "Password",
  "phone": "Phone",
  "explore": "Explore",
  "explore_body": "Choose Whatever Product you wish for in the easiest way possible.",
  "shipping": "Shipping",
  "payment": "Make the Payment",
  "shipping_body": "Your Order will be shipped to you as fast as possible by your carrier.",
  "payment_body": "Pay in the safest way possible either by cash or credit cards.",
  "have_account": "Don't have an account?"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
