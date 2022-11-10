import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supershop/core/components/custom_app_bar.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/constance.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/core/utils/token_secure_storage.dart';
import 'package:supershop/features/home/presentation/components/settings_item_component.dart';
import 'package:supershop/features/home/presentation/controllers/profile/profile_bloc.dart';
import 'package:supershop/features/home/presentation/screens/addresses_screen.dart';
import 'package:supershop/features/home/presentation/screens/orders_screen.dart';
import 'package:supershop/features/register/presentation/screens/login_screen.dart';
import 'package:supershop/general/cubit/app_cubit.dart';
import 'package:supershop/generated/locale_keys.g.dart';

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
            AppSize.sizedBox28(context),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0.w),
              height: 56.0.h,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.deleteColorLight,
                  ),
                  borderRadius: BorderRadius.circular(5.0.r)),
              child: MaterialButton(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.backgroundColorDark
                    : AppColors.backgroundColorLight,
                onPressed: () async {
                  context.read<ProfileBloc>().add(
                        SignOutEvent(
                          token: token!,
                        ),
                      );
                  token = await TokenSecureStorage.deleteSecureToken()
                      .then((value) {
                    navigateAndFinish(context, LoginScreen());
                  });

                  print(token);
                },
                textColor: AppColors.deleteColorLight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.logout_outlined),
                    AppSize.sizedBoxW5(context),
                    Text(
                      LocaleKeys.signOut.tr(),
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
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
