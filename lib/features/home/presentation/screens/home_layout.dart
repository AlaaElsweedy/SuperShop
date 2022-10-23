import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/services/service_locator.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/features/home/presentation/screens/categories_screen.dart';
import 'package:supershop/features/home/presentation/screens/favorites_screen.dart';
import 'package:supershop/features/home/presentation/screens/home_screen.dart';
import 'package:supershop/features/home/presentation/screens/settings_screen.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HomeBloc>()..add(GetHomeDataEvent()),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            changeIndex(value);
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
        body: screens[currentIndex],
      ),
    );
  }
}
