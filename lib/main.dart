import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supershop/core/helpers/cache_helper.dart';
import 'package:supershop/core/utils/constance.dart';
import 'package:supershop/core/utils/styles/app_themes/dark_theme.dart';
import 'package:supershop/core/utils/token_secure_storage.dart';
import 'package:supershop/features/home/presentation/controllers/address/address_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/cart/cart_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/favorites/favorites_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/orders/orders_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/profile/profile_bloc.dart';
import 'package:supershop/features/home/presentation/screens/home_screen.dart';
import 'package:supershop/features/register/presentation/screens/login_screen.dart';
import 'package:supershop/features/register/presentation/screens/on_boarding_screen.dart';
import 'package:supershop/general/cubit/app_cubit.dart';
import 'package:supershop/localization/localization_service.dart';

import 'core/helpers/dio_helper.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_string.dart';
import 'core/utils/styles/app_themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  ServiceLocator.init();

  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();

  Object? onBoardingSeen = CacheHelper.getData(key: 'isOnBoardingSeen');
  var isDark = CacheHelper.getData(key: 'isDark');
  isDark ??= false;
  //print('Main token $token');

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
        )),
      );
    },
  );
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
        designSize: const Size(375, 812),
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
