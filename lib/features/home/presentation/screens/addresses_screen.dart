import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:supershop/features/home/presentation/screens/add_address_screen.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({Key? key}) : super(key: key);

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      buildWhen: (previous, current) =>
          previous.getAddressState != current.getAddressState,
      builder: (context, state) {
        print('address state $state;');
        switch (state.getAddressState) {
          case RequestState.isLoading:
            return const ShowCircularLoading();

          case RequestState.success:
            var addresses = state.getAddress!.getAddressInfo.getAddressData;
            var selectedAddress = state
                .getAddress!.getAddressInfo.getAddressData[selectedIndex].id;

            return Scaffold(
              appBar: const CustomAppBar(),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.addAddress.tr(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        CustomTextButton(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          onPressed: () {
                            navigateTo(context, AddAddressScreen());
                          },
                          child: LocaleKeys.addAddress.tr(),
                        ),
                      ],
                    ),
                    AppSize.sizedBox15,
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            addressItemComponent(index, addresses),
                        separatorBuilder: (context, index) =>
                            AppSize.sizedBox10,
                        itemCount: addresses.length,
                      ),
                    ),
                    AppSize.sizedBox10,
                    BlocBuilder<OrdersBloc, OrdersState>(
                      buildWhen: (previous, current) =>
                          previous.addOrderState != current.addOrderState,
                      builder: (context, state) {
                        if (state.addOrderState == RequestState.isLoading) {
                          const ShowCircularLoading();
                        }

                        print('Order state $state;');
                        return CustomButton(
                          title: LocaleKeys.addOrder.tr(),
                          onPressed: () {
                            context.read<OrdersBloc>().add(
                                  AddOrderEvent(
                                    addressId: selectedAddress,
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
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? AppColors.primaryColorLight
              : AppColors.textFiledFillColorLight,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 26,
              color: selectedIndex == index
                  ? AppColors.backgroundColorLight
                  : AppColors.primaryColorLight,
            ),
            AppSize.sizedBoxW10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${addresses[index].city}, ${addresses[index].region}',
                  style: selectedIndex == index
                      ? const TextStyle(
                          color: AppColors.normalTextWitheColorLight,
                          fontSize: 18.0,
                        )
                      : Theme.of(context).textTheme.bodyMedium,
                ),
                AppSize.sizedBox10,
                Text(
                  addresses[index].details,
                  style: selectedIndex == index
                      ? const TextStyle(
                          color: AppColors.normalTextWitheColorLight,
                          fontSize: 18.0,
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
