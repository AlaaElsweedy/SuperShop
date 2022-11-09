import 'package:flutter/material.dart';
import 'package:supershop/core/utils/app_string.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(AppString.appName),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
