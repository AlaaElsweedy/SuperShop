import 'package:flutter/material.dart';
import 'package:supershop/core/components/navigation_component.dart';
import 'package:supershop/features/home/presentation/screens/categories_screen.dart';
import 'package:supershop/features/home/presentation/screens/favorites_screen.dart';
import 'package:supershop/features/home/presentation/screens/home_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                navigateTo(context, HomeScreen());
              },
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Home',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                navigateTo(context, const CategoriesScreen());
              },
              child: ListTile(
                leading: Icon(
                  Icons.dashboard,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Categories',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                navigateTo(context, const FavoritesScreen());
              },
              child: ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Favorites',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
