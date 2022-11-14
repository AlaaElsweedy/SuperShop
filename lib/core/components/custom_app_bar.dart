import 'package:flutter/material.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/features/home/presentation/screens/search_screen.dart';
import '../utils/app_string.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(AppString.appName),
      actions: [
        IconButton(
          onPressed: () {
            navigateTo(context, SearchScreen());
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
