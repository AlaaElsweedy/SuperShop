import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/change_lang_drop_menu_component.dart';
import '../components/sign_out_button_component.dart';
import 'change_password_screen.dart';
import '../../../../core/components/custom_app_bar.dart';
import '../../../../core/components/navigation.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../components/settings_item_component.dart';
import 'addresses_screen.dart';
import 'orders_screen.dart';
import '../../../../general/cubit/app_cubit.dart';
import '../../../../generated/locale_keys.g.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.greyBackgroundColorDark
          : AppColors.greyBackgroundColorLight,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(title: LocaleKeys.profile.tr().toUpperCase()),
            SettingItemComponent(
              onPressed: () {
                navigateTo(context, const OrdersScreen());
              },
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
            SettingItemComponent(
              onPressed: () {
                navigateTo(context, ChangePasswordScreen());
              },
              icon: Icons.vpn_key,
              title: LocaleKeys.changePassword.tr(),
            ),
            TitleText(title: LocaleKeys.settings.tr().toUpperCase()),
            SettingItemComponent(
              icon: Icons.dark_mode_sharp,
              title: LocaleKeys.darkMode.tr(),
              trailing: SizedBox(
                height: 20.h,
                child: Switch.adaptive(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: AppColors.backgroundColorLight,
                  inactiveThumbColor: AppColors.greyBackgroundColorLight,
                  activeTrackColor: AppColors.pageIndicatorActiveDotColorLight,
                  value: AppCubit.get(context).isDark,
                  inactiveTrackColor:
                      AppColors.pageIndicatorInActiveDotColorLight,
                  onChanged: (value) {
                    !AppCubit.get(context).isDark;
                    AppCubit.get(context).changeModeTheme();
                  },
                ),
              ),
            ),
            const ChangeLangDropMenuComponent(),
            // TitleText(title: LocaleKeys.reachUs.tr().toUpperCase()),
            // SettingItemComponent(
            //   onPressed: () {},
            //   icon: Icons.call,
            //   title: LocaleKeys.contactUs.tr(),
            // ),
            AppSize.sizedBox28(context),
            const SignOutButtonComponent(),
            AppSize.sizedBox28(context),
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
