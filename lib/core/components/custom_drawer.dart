import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/features/home/presentation/screens/cart_screen.dart';
import 'package:supershop/features/home/presentation/screens/categories_screen.dart';
import 'package:supershop/features/home/presentation/screens/favorites_screen.dart';
import 'package:supershop/features/home/presentation/screens/home_screen.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class CustomDrawer extends StatelessWidget {
  final Map<int, bool>? favorites;

  const CustomDrawer({Key? key, this.favorites = const {}}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerItem(
              icon: Icons.home,
              title: LocaleKeys.home.tr(),
              function: () {
                Navigator.of(context).pop();
                navigateTo(context, HomeScreen());
              },
            ),
            DrawerItem(
              icon: Icons.dashboard,
              title: LocaleKeys.categories.tr(),
              function: () {
                Navigator.of(context).pop();
                navigateTo(context, const CategoriesScreen());
              },
            ),
            DrawerItem(
              icon: Icons.favorite,
              title: LocaleKeys.favorites.tr(),
              function: () {
                //sl<FavoritesBloc>().add(GetFavoriteProductEvent());
                Navigator.of(context).pop();
                navigateTo(
                  context,
                  FavoritesScreen(favorites: favorites!),
                );
              },
            ),
            DrawerItem(
              icon: Icons.shopping_cart,
              title: LocaleKeys.cart.tr(),
              function: () {
                Navigator.of(context).pop();
                navigateTo(context, CartScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback function;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
