import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supershop/core/components/custom_app_bar.dart';
import 'package:supershop/core/components/custom_button.dart';
import 'package:supershop/core/components/custom_text_button.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/domain/entities/address/get_address_data.dart';
import 'package:supershop/features/home/presentation/components/bottom_model_sheet_component.dart';
import 'package:supershop/features/home/presentation/controllers/address/address_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/orders/orders_bloc.dart';
import 'package:supershop/features/home/presentation/screens/add_or_update_address_screen.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        switch (state.getAddressState) {
          case RequestState.isLoading:
            return const ShowCircularLoading();

          case RequestState.success:
            var addresses = state.getAddress!.getAddressInfo.getAddressData;
            // var selectedAddress = state
            //     .getAddress!.getAddressInfo.getAddressData[selectedIndex].id;

            return Scaffold(
              appBar: const CustomAppBar(),
              body: Padding(
                padding: AppSize.paddingAll10,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.addresses.tr(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        CustomTextButton(
                          onPressed: () {
                            navigateTo(context, AddOrUpdateAddressScreen());
                          },
                          title: LocaleKeys.addAddress.tr(),
                        ),
                      ],
                    ),
                    AppSize.sizedBox15(context),
                    addresses.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(top: 200.h),
                            child: Text(
                              LocaleKeys.addAddressFirst.tr(),
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) =>
                                  addressItemComponent(index, addresses),
                              separatorBuilder: (context, index) =>
                                  AppSize.sizedBox10(context),
                              itemCount: addresses.length,
                            ),
                          ),
                    if (addresses.isEmpty) const Spacer(),
                    AppSize.sizedBox10(context),
                    addresses.isEmpty
                        ? Container()
                        : BlocBuilder<OrdersBloc, OrdersState>(
                            buildWhen: (previous, current) =>
                                previous.addOrderState != current.addOrderState,
                            builder: (context, state) {
                              if (state.addOrderState ==
                                  RequestState.isLoading) {
                                const ShowCircularLoading();
                              }

                              return CustomButton(
                                title: LocaleKeys.checkout.tr(),
                                onPressed: () {
                                  var addressId = context
                                      .read<AddressBloc>()
                                      .state
                                      .getAddress!
                                      .getAddressInfo
                                      .getAddressData[selectedIndex]
                                      .id;
                                  context.read<OrdersBloc>().add(
                                        AddOrderEvent(
                                          addressId: addressId,
                                        ),
                                      );
                                  bottomModelSheetComponent(context);
                                },
                              );
                            },
                          ),
                  ],
                ),
              ),
            );

          case RequestState.error:
            return ShowError(networkExceptions: state.getAddressErrorMessage!);
        }
      },
    );
  }

  InkWell addressItemComponent(int index, List<GetAddressData> addresses) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: AppSize.paddingAll10,
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? AppColors.primaryColorLight
              : AppColors.textFiledFillColorLight,
          borderRadius: BorderRadius.all(
            Radius.circular(4.r),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 35.r,
              color: selectedIndex == index
                  ? AppColors.backgroundColorLight
                  : AppColors.primaryColorLight,
            ),
            AppSize.sizedBoxW10(context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${addresses[index].city}, ${addresses[index].region}',
                  style: selectedIndex == index
                      ? TextStyle(
                          color: AppColors.normalTextWitheColor,
                          fontSize: 20.0.sp,
                        )
                      : Theme.of(context).textTheme.bodyMedium,
                ),
                AppSize.sizedBox10(context),
                Text(
                  addresses[index].details,
                  style: selectedIndex == index
                      ? TextStyle(
                          color: AppColors.normalTextWitheColor,
                          fontSize: 20.0.sp,
                        )
                      : Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
