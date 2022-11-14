import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/custom_text_button.dart';
import '../../../../core/components/my_dividers.dart';
import '../../../../core/components/navigation.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../../domain/entities/address/get_address_data.dart';
import '../controllers/address/address_bloc.dart';
import '../screens/add_or_update_address_screen.dart';
import '../../../../generated/locale_keys.g.dart';

class AddressItemComponent extends StatelessWidget {
  final GetAddressData address;

  const AddressItemComponent({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.borderColor
                : AppColors.borderColor,
          ),
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.greyBackgroundColorDark
              : AppColors.greyBackgroundColorLight,
          borderRadius: BorderRadius.circular(10.0.r),
        ),
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
                  AppSize.sizedBoxW10(context),
                  Expanded(
                    child: Text(' ${address.notes}'),
                  ),
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
