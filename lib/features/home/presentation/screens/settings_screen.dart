import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:supershop/core/components/custom_app_bar.dart';
import 'package:supershop/core/components/my_dividers.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/presentation/screens/addresses_screen.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackgroundColorLight,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(title: LocaleKeys.profile.tr().toUpperCase()),
            SettingItemComponent(
              onPressed: () {},
              icon: Icons.menu,
              title: LocaleKeys.orders.tr(),
            ),
            SettingItemComponent(
              onPressed: () {
                navigateTo(context, const AddressesScreen());
              },
              icon: Icons.location_pin,
              title: LocaleKeys.addresses.tr(),
            ),
            TitleText(title: LocaleKeys.settings.tr().toUpperCase()),
            SettingItemComponent(
              onPressed: () {},
              icon: Icons.dark_mode_sharp,
              title: LocaleKeys.darkMode.tr(),
            ),
            SettingItemComponent(
              onPressed: () {},
              icon: Icons.flag,
              title: LocaleKeys.language.tr(),
            ),
            TitleText(title: LocaleKeys.reachUs.tr().toUpperCase()),
            SettingItemComponent(
              onPressed: () {},
              icon: Icons.info_outline,
              title: LocaleKeys.questions.tr(),
            ),
            SettingItemComponent(
              onPressed: () {},
              icon: Icons.call,
              title: LocaleKeys.contactUs.tr(),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSize.paddingAll20,
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

class SettingItemComponent extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback onPressed;

  const SettingItemComponent({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            color: AppColors.backgroundColorLight,
            padding: AppSize.paddingAll20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: AppColors.primaryColorLight,
                    ),
                    AppSize.sizedBoxW5,
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
