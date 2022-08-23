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
  "signUp": "تسجيل",
  "email": "البريد الإلكتروني",
  "password": "الرقم السري",
  "phone": "رقم الهاتف",
  "explore": "استكشف",
  "shipping": "الشحن",
  "payment": "الدفع",
  "shippingBody": "سيتم شحن طلبك إليك في أسرع وقت ممكن من قبل شركة الشحن الخاصة بك",
  "paymentBody": "ادفع بأكثر الطرق أمانًا سواء نقدًا أو ببطاقات الائتمان",
  "fullName": "الاسم بالكامل",
  "haveAccount": "ليس لديك حساب؟",
  "emailValidator": "من فضلك ادخل البريد الالكتروني ...",
  "passwordValidator": "من فضلك ادخل كلمة المرور ...",
  "passwordLengthValidator": "كلمة المرور يجب ان تحتوي علي الاقل علي ٨ ارقام.",
  "emailAddressFormat": "يرجى إدخال البريد الإلكتروني الصحيح...",
  "exploreBody": "اختر أي منتج تريده بأسهل طريقة ممكنة"
};
static const Map<String,dynamic> en = {
  "skip": "Skip",
  "next": "Next",
  "previous": "Previous",
  "finish": "Finish",
  "signInToYourAccount": "Sign in to your account",
  "signIn": "SIGN IN",
  "signUp": "SIGN UP",
  "fullName": "Full Name",
  "email": "Email",
  "password": "Password",
  "phone": "Phone",
  "explore": "Explore",
  "exploreBody": "Choose Whatever Product you wish for in the easiest way possible.",
  "shipping": "Shipping",
  "payment": "Make the Payment",
  "shippingBody": "Your Order will be shipped to you as fast as possible by your carrier.",
  "haveAccount": "Don't have an account?",
  "emailValidator": "Please enter your email ...",
  "passwordValidator": "Please enter your password...",
  "passwordLengthValidator": "Password must has at least 8 numbers.",
  "emailAddressFormat": "Please enter a valid email...",
  "paymentBody": "Pay in the safest way possible either by cash or credit cards."
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
