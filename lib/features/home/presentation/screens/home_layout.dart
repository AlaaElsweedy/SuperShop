import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/services/service_locator.dart';
import 'package:supershop/core/utils/app_string.dart';
import 'package:supershop/features/home/presentation/controller/categories_bloc/categories_bloc.dart';
import 'package:supershop/features/home/presentation/controller/cubit/nav_bar_cubit.dart';
import 'package:supershop/features/home/presentation/controller/cubit/nav_bar_state.dart';
import 'package:supershop/features/home/presentation/controller/get_favorites/get_favorites_bloc.dart';
import 'package:supershop/features/home/presentation/controller/home_bloc/home_bloc.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<NavBarCubit>(),
        ),
        BlocProvider(
          //lazy: false,
          create: (context) => sl<HomeBloc>()..add(const GetHomeDataEvent()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) =>
              sl<CategoriesBloc>()..add(const GetCategoriesDataEvent()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) =>
              sl<GetFavoritesBloc>()..add(const GetFavoriteProductsEvent()),
        ),
      ],
      child: BlocBuilder<NavBarCubit, NavBarStates>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          var cubit = NavBarCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                AppString.appName,
              ),
              titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.changeIndex(value);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: LocaleKeys.home,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.apps),
                  label: LocaleKeys.categories,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: LocaleKeys.favorites,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: LocaleKeys.settings,
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
