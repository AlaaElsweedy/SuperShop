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

class AddAddressScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        showSuccessMessage(state.addAddress!.message);
                      }
                    },
                    builder: (context, state) {
                      if (state.addAddressState == RequestState.isLoading) {
                        return const ShowCircularLoading();
                      }

                      return Column(
                        children: [
                          CustomButton(
                            title: LocaleKeys.save.tr(),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
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
                            },
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
