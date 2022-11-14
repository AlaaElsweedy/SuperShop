import '../core/utils/app_string.dart';

class Language {
  final int id;
  final String name;
  final String languageCode;
  final String flag;

  Language({
    required this.id,
    required this.name,
    required this.languageCode,
    required this.flag,
  });

  static List<Language> languages = [
    Language(
      id: 1,
      name: AppString.english,
      languageCode: 'en',
      flag: '🇺🇸',
    ),
    Language(
      id: 2,
      name: AppString.arabic,
      languageCode: 'ar',
      flag: '🇪🇬',
    ),
  ];
}
