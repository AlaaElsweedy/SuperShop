import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/custom_app_bar.dart';
import 'package:supershop/core/components/custom_text_button.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/presentation/components/address_item_component.dart';
import 'package:supershop/features/home/presentation/controllers/address/address_bloc.dart';
import 'package:supershop/features/home/presentation/screens/add_or_update_address_screen.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        switch (state.getAddressState) {
          case RequestState.isLoading:
            return const ShowCircularLoading();

          case RequestState.success:
            var addresses = state.getAddress!.getAddressInfo.getAddressData;

            return Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: const CustomAppBar(),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: AppSize.paddingAll10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.yourAddresses.tr(),
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
                      AppSize.sizedBox10(context),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => AddressItemComponent(
                          address: addresses[index],
                        ),
                        separatorBuilder: (context, index) =>
                            AppSize.sizedBox10(context),
                        itemCount: addresses.length,
                      ),
                    ],
                  ),
                ),
              ),
            );

          case RequestState.error:
            return ShowError(networkExceptions: state.getAddressErrorMessage!);
        }
      },
    );
  }
}
