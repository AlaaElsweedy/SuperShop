import 'package:flutter/material.dart';
import 'package:supershop/core/components/custom_text_button.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/features/home/presentation/screens/home_screen.dart';

Future<dynamic> bottomModelSheetComponent(BuildContext context) {
  return showModalBottomSheet(
    isDismissible: false,
    enableDrag: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    context: context,
    builder: (context) => SizedBox(
      width: double.infinity,
      child: Padding(
        padding: AppSize.paddingAll,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/order_done.png',
              height: 200,
            ),
            AppSize.sizedBox10,
            const Text(
              'Thank You!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            AppSize.sizedBox20,
            const Text(
              'Your Order is now being processed. We will let you know once the order is picked from the outlet. Check the status of your Order',
              textAlign: TextAlign.center,
            ),
            AppSize.sizedBox20,
            CustomTextButton(
              onPressed: () {
                navigateTo(context, HomeScreen());
              },
              child: 'Back To Home',
            ),
          ],
        ),
      ),
    ),
  );
}
