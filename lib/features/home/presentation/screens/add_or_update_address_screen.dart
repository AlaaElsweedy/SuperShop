import 'package:buildcondition/buildcondition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:supershop/core/components/custom_app_bar.dart';
import 'package:supershop/core/components/custom_button.dart';
import 'package:supershop/core/components/custom_text_form_field.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/features/home/presentation/controllers/address/address_bloc.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class AddOrUpdateAddressScreen extends StatelessWidget {
  final bool? editAddress;
  final int? addressId;
  final String? name;
  final String? city;
  final String? region;
  final String? details;
  final String? notes;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  AddOrUpdateAddressScreen({
    Key? key,
    this.editAddress = false,
    this.addressId,
    this.name,
    this.city,
    this.region,
    this.details,
    this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (editAddress!) {
      nameController.text = name!;
      cityController.text = city!;
      regionController.text = region!;
      detailsController.text = details!;
      notesController.text = notes!;
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.yourAddress.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  AppSize.sizedBox20,
                  CustomTextFormField(
                    context: context,
                    hintText: LocaleKeys.name.tr(),
                    validator: qValidator(
                      [
                        IsRequired(LocaleKeys.requiredField.tr()),
                      ],
                    ),
                    controller: nameController,
                    type: TextInputType.name,
                    prefixIcon: const Icon(Icons.person),
                  ),
                  AppSize.sizedBox10,
                  CustomTextFormField(
                    context: context,
                    hintText: LocaleKeys.city.tr(),
                    validator: qValidator(
                      [
                        IsRequired(LocaleKeys.requiredField.tr()),
                      ],
                    ),
                    controller: cityController,
                    type: TextInputType.text,
                    prefixIcon: const Icon(Icons.location_city),
                  ),
                  AppSize.sizedBox10,
                  CustomTextFormField(
                    context: context,
                    hintText: LocaleKeys.region.tr(),
                    validator: qValidator(
                      [
                        IsRequired(LocaleKeys.requiredField.tr()),
                      ],
                    ),
                    controller: regionController,
                    type: TextInputType.name,
                    prefixIcon: const Icon(Icons.gps_fixed),
                  ),
                  AppSize.sizedBox10,
                  CustomTextFormField(
                    context: context,
                    hintText: LocaleKeys.details.tr(),
                    validator: qValidator(
                      [
                        IsRequired(LocaleKeys.requiredField.tr()),
                      ],
                    ),
                    controller: detailsController,
                    type: TextInputType.text,
                    prefixIcon: const Icon(Icons.details),
                  ),
                  AppSize.sizedBox10,
                  CustomTextFormField(
                    context: context,
                    hintText: LocaleKeys.notes.tr(),
                    validator: qValidator(
                      [
                        IsRequired(LocaleKeys.requiredField.tr()),
                      ],
                    ),
                    controller: notesController,
                    type: TextInputType.text,
                    prefixIcon: const Icon(Icons.note),
                  ),
                  AppSize.sizedBox15,
                  BlocConsumer<AddressBloc, AddressState>(
                    listener: (context, state) {
                      if (state.addAddressState == RequestState.success) {
                        Navigator.pop(context);
                      }

                      if (state.updateAddressState == RequestState.success) {
                        showSuccessMessage(state.updateAddress!.message);
                        Navigator.pop(context);
                      }
                    },
                    buildWhen: (previous, current) =>
                        previous.getAddressState != current.getAddressState,
                    builder: (context, state) {
                      print('add address $state');
                      if (state.addAddressState == RequestState.isLoading ||
                          state.updateAddressState == RequestState.isLoading) {
                        return const ShowCircularLoading();
                      }

                      return Column(
                        children: [
                          BuildCondition(
                            condition: state.addAddressState !=
                                    RequestState.isLoading ||
                                state.updateAddressState !=
                                    RequestState.isLoading,
                            builder: (context) => CustomButton(
                              title: editAddress!
                                  ? LocaleKeys.edit.tr()
                                  : LocaleKeys.save.tr(),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                  if (editAddress!) {
                                    context
                                        .read<AddressBloc>()
                                        .add(UpdateAddressesEvent(
                                          addressId: addressId!,
                                          name: nameController.text,
                                          city: cityController.text,
                                          region: regionController.text,
                                          details: detailsController.text,
                                          notes: notesController.text,
                                        ));
                                  } else {
                                    context.read<AddressBloc>().add(
                                          AddAddressEvent(
                                            name: nameController.text,
                                            city: cityController.text,
                                            region: regionController.text,
                                            details: detailsController.text,
                                            notes: notesController.text,
                                          ),
                                        );
                                  }
                                }
                              },
                            ),
                            fallback: (context) => const ShowCircularLoading(),
                          ),
                          AppSize.sizedBox10,
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
