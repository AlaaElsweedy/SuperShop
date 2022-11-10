import 'package:flutter/material.dart';
import 'package:supershop/core/components/my_dividers.dart';
import 'package:supershop/core/utils/app_size.dart';

class SettingItemComponent extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onPressed;

  const SettingItemComponent({
    Key? key,
    required this.icon,
    required this.title,
    this.onPressed,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            color: Theme.of(context).backgroundColor,
            padding: AppSize.paddingAll20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: Theme.of(context).primaryColor,
                    ),
                    AppSize.sizedBoxW5(context),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                trailing ?? const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
        ),
        const MyDivider(),
      ],
    );
  }
}
