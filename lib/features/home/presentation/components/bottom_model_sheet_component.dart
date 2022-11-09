import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supershop/core/components/custom_text_button.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/features/home/presentation/screens/home_screen.dart';
import 'package:supershop/generated/locale_keys.g.dart';

Future<dynamic> bottomModelSheetComponent(BuildContext context) {
  return showModalBottomSheet(
    isDismissible: false,
    enableDrag: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.r),
        topRight: Radius.circular(15.r),
      ),
    ),
    context: context,
    builder: (context) => SizedBox(
      width: double.infinity,
      child: Padding(
        padding: AppSize.paddingAll20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/order_done.png',
              height: 200.h,
            ),
            AppSize.sizedBox10(context),
            Text(
              LocaleKeys.thankYou.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            AppSize.sizedBox20(context),
            Text(
              LocaleKeys.orderProcessing.tr(),
              textAlign: TextAlign.center,
            ),
            AppSize.sizedBox20(context),
            CustomTextButton(
              onPressed: () {
                navigateTo(context, HomeScreen());
              },
              title: LocaleKeys.backHome.tr(),
            ),
          ],
        ),
      ),
    ),
  );
}
