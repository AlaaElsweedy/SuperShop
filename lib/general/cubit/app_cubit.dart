import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../language.dart';
import '../../core/helpers/cache_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeModeTheme({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeThemeAppState());
    } else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((_) {
        emit(ChangeThemeAppState());
      });
    }
  }

  void changeLanguage(BuildContext context, Language language) {
    switch (language.languageCode) {
      case 'en':
        context.setLocale(const Locale('en'));
        //apiDataLanguage = language.languageCode;
        //CacheHelper.saveData(key: 'dataLanguage', value: apiDataLanguage);
        break;
      case 'ar':
        context.setLocale(const Locale('ar'));
        //apiDataLanguage = language.languageCode;
        //CacheHelper.saveData(key: 'dataLanguage', value: apiDataLanguage);
        break;
      default:
        context.setLocale(const Locale('en'));
      //apiDataLanguage = language.languageCode;
    }
  }
}
