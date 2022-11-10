import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supershop/core/components/custom_text_button.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/features/home/presentation/screens/home_screen.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class NoOrdersComponent extends StatelessWidget {
  const NoOrdersComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/no_data.svg', height: 250.h),
        Text(
          LocaleKeys.noOrders.tr(),
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        AppSize.sizedBox10(context),
        Text(
          LocaleKeys.savedOrders.tr(),
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
        AppSize.sizedBox20(context),
        CustomTextButton(
          title: LocaleKeys.backHome.tr(),
          onPressed: () {
            navigateTo(context, HomeScreen());
          },
        ),
      ],
    );
  }
}
