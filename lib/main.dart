import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/categories_bloc/categories_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/favorites/favorites_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/localization/localization_service.dart';

import 'core/helpers/dio_helper.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_string.dart';
import 'core/utils/startScreen.dart';
import 'core/utils/styles/app_themes/light_theme.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HomeBloc>()..add(const GetHomeDataEvent()),
        ),
        BlocProvider(
          create: (context) =>
              sl<CategoriesBloc>()..add(const GetCategoriesDataEvent()),
        ),
        BlocProvider(
          create: (context) =>
              sl<FavoritesBloc>()..add(GetFavoriteProductEvent()),
        ),
      ],
      child: MaterialApp(
        title: AppString.appName,
        debugShowCheckedModeBanner: false,
        theme: LightTheme.lightTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: startWidget,
      ),
    );
  }
}
