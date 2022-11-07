import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/custom_text_button.dart';
import 'package:supershop/core/components/my_dividers.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/enums.dart';
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
        color: AppColors.greyBackgroundColorLight,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Card(
        child: Padding(
          padding: AppSize.paddingAll10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_pin),
                  AppSize.sizedBoxW5,
                  Text(
                    address.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              AppSize.sizedBox10,
              const MyDivider(),
              AppSize.sizedBox10,
              Text(
                '${address.city}, ${address.region}, ${address.details}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              AppSize.sizedBox10,
              Row(
                children: [
                  Text('${LocaleKeys.notes.tr()}:'),
                  Text(' ${address.notes}'),
                ],
              ),
              AppSize.sizedBox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextButton(
                    padding: EdgeInsets.zero,
                    size: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                    titleColor: AppColors.productInfoColorLight,
                  ),
                  AppSize.sizedBoxW10,
                  const MyVerticalDivider(),
                  AppSize.sizedBoxW10,
                  CustomTextButton(
                    padding: EdgeInsets.zero,
                    size: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onPressed: () {
                      context
                          .read<AddressBloc>()
                          .add(DeleteAddressesEvent(addressId: address.id));
                    },
                    title: LocaleKeys.remove.tr(),
                    titleColor: AppColors.deleteColorLight,
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
