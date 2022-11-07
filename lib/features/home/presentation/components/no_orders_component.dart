import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:supershop/core/components/custom_text_button.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class NoOrdersComponent extends StatelessWidget {
  const NoOrdersComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/no_data.svg'),
          AppSize.sizedBox20,
          Text(
            LocaleKeys.noOrders.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            LocaleKeys.savedOrders.tr(),
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          AppSize.sizedBox20,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextButton(
              title: LocaleKeys.backHome.tr(),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
