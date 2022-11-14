import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helpers/cache_helper.dart';
import 'core/utils/constance.dart';
import 'core/utils/styles/app_themes/dark_theme.dart';
import 'core/helpers/token_secure_storage_helper.dart';
import 'features/home/presentation/controllers/address/address_bloc.dart';
import 'features/home/presentation/controllers/cart/cart_bloc.dart';
import 'features/home/presentation/controllers/favorites/favorites_bloc.dart';
import 'features/home/presentation/controllers/home/home_bloc.dart';
import 'features/home/presentation/controllers/orders/orders_bloc.dart';
import 'features/home/presentation/controllers/profile/profile_bloc.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/register/presentation/screens/login_screen.dart';
import 'features/register/presentation/screens/on_boarding_screen.dart';
import 'general/cubit/app_cubit.dart';
import 'localization/localization_service.dart';

import 'core/helpers/dio_helper.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_string.dart';
import 'core/utils/styles/app_themes/light_theme.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  DioHelper.init();
  ServiceLocator.init();

  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();

  Object? onBoardingSeen = CacheHelper.getData(key: 'isOnBoardingSeen');
  var isDark = CacheHelper.getData(key: 'isDark');
  isDark ?? false;
  //var screen = await startScreen(isDark: isDark);
  token = await TokenSecureStorageHelper.readSecureToken();

  //String? dataLanguage = CacheHelper.getData(key: 'dataLanguage');
  //dataLanguage ?? apiDataLanguage;
  //print('api Language $apiDataLanguage');
  //print(dataLanguage);

  Widget startWidget;

  if (token == null) {
    if (onBoardingSeen == null) {
      startWidget = const OnBoardingScreen();
    } else {
      startWidget = LoginScreen();
    }
  } else {
    startWidget = HomeScreen();
  }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(
        initialLocalization(
            child: MyApp(
          startWidget: startWidget,
          isDark: isDark,
          //language: dataLanguage,
        )),
      );
    },
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  final bool isDark;

  const MyApp({
    super.key,
    required this.startWidget,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HomeBloc>()
            ..add(GetHomeDataEvent())
            ..add(GetCategoriesEvent()),
        ),
        BlocProvider(
          create: (context) =>
              sl<FavoritesBloc>()..add(GetFavoriteProductEvent()),
        ),
        BlocProvider(
          create: (context) => sl<CartBloc>()..add(GetCartProductsEvent()),
        ),
        BlocProvider(
          create: (context) => sl<AddressBloc>()..add(GetAddressesEvent()),
        ),
        BlocProvider(
          create: (context) => sl<OrdersBloc>()..add(GetOrdersEvent()),
        ),
        BlocProvider(
          create: (context) => sl<ProfileBloc>()..add(GetProfileEvent()),
        ),
        BlocProvider(
          create: (context) =>
              sl<AppCubit>()..changeModeTheme(fromShared: isDark),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return MaterialApp(
              title: AppString.appName,
              debugShowCheckedModeBanner: false,
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              theme: LightTheme.lightTheme,
              darkTheme: DarkTheme.darkTheme,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              home: startWidget,
            );
          },
        ),
      ),
    );
  }
}
