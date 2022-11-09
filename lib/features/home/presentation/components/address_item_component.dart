import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supershop/core/components/custom_text_button.dart';
import 'package:supershop/core/components/my_dividers.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/domain/entities/address/get_address_data.dart';
import 'package:supershop/features/home/presentation/controllers/address/address_bloc.dart';
import 'package:supershop/features/home/presentation/screens/add_or_update_address_screen.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class AddressItemComponent extends StatelessWidget {
  final GetAddressData address;

  const AddressItemComponent({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.greyBackgroundColorDark
            : AppColors.greyBackgroundColorLight,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Card(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.greyBackgroundColorDark
            : AppColors.greyBackgroundColorLight,
        child: Padding(
          padding: AppSize.paddingAll20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  AppSize.sizedBoxW5(context),
                  Text(
                    address.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              AppSize.sizedBox10(context),
              const MyDivider(),
              AppSize.sizedBox10(context),
              Text(
                '${address.city}, ${address.region}, ${address.details}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              AppSize.sizedBox10(context),
              Row(
                children: [
                  Text('${LocaleKeys.notes.tr()}:'),
                  Text(' ${address.notes}'),
                ],
              ),
              AppSize.sizedBox20(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextButton(
                    onPressed: () {
                      navigateTo(
                        context,
                        AddOrUpdateAddressScreen(
                          editAddress: true,
                          addressId: address.id,
                          name: address.name,
                          city: address.city,
                          region: address.region,
                          details: address.details,
                          notes: address.notes,
                        ),
                      );
                    },
                    title: LocaleKeys.edit.tr(),
                  ),
                  AppSize.sizedBoxW10(context),
                  const MyVerticalDivider(),
                  AppSize.sizedBoxW10(context),
                  CustomTextButton(
                    onPressed: () {
                      context
                          .read<AddressBloc>()
                          .add(DeleteAddressesEvent(addressId: address.id));
                    },
                    title: LocaleKeys.remove.tr(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
