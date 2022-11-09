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
import 'package:supershop/features/home/presentation/controllers/profile/profile_bloc.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class ProfileScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        switch (state.getProfileState) {
          case RequestState.isLoading:
            return const ShowCircularLoading();

          case RequestState.success:
            var profile = state.getProfile!.getProfileData;

            nameController.text = profile.name;
            emailController.text = profile.email;
            phoneController.text = profile.phone;

            return Scaffold(
              appBar: const CustomAppBar(),
              body: Padding(
                padding: AppSize.paddingHorizontal20,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.profile.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      AppSize.sizedBox28(context),
                      CustomTextFormField(
                        context: context,
                        hintText: LocaleKeys.name.tr(),
                        validator: qValidator([
                          IsRequired(LocaleKeys.requiredField.tr()),
                        ]),
                        controller: nameController,
                        type: TextInputType.name,
                        prefixIcon: const Icon(Icons.person),
                      ),
                      AppSize.sizedBox15(context),
                      CustomTextFormField(
                        context: context,
                        hintText: LocaleKeys.email.tr(),
                        validator: qValidator([
                          IsRequired(LocaleKeys.requiredField.tr()),
                          IsEmail(LocaleKeys.emailAddressFormat.tr()),
                        ]),
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        prefixIcon: const Icon(Icons.email),
                      ),
                      AppSize.sizedBox15(context),
                      CustomTextFormField(
                        context: context,
                        hintText: LocaleKeys.phone.tr(),
                        validator: qValidator([
                          IsRequired(LocaleKeys.requiredField.tr()),
                          IsEgyptianPhone(LocaleKeys.isPhoneNumber.tr()),
                        ]),
                        controller: phoneController,
                        type: TextInputType.phone,
                        prefixIcon: const Icon(Icons.phone),
                      ),
                      AppSize.sizedBox28(context),
                      BuildCondition(
                        condition:
                            state.updateProfileState != RequestState.isLoading,
                        builder: (context) =>
                            BlocListener<ProfileBloc, ProfileState>(
                          listener: (context, state) {
                            if (state.updateProfileState ==
                                RequestState.success) {
                              showSuccessMessage(state.updateProfile!.message);
                            }
                          },
                          child: CustomButton(
                            title: LocaleKeys.update.tr(),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                context.read<ProfileBloc>().add(
                                      UpdateProfileEvent(
                                        name: nameController.text,
                                        email: emailController.text,
                                        phoneNumber: phoneController.text,
                                      ),
                                    );
                              }
                            },
                          ),
                        ),
                        fallback: (context) => const ShowCircularLoading(),
                      ),
                    ],
                  ),
                ),
              ),
            );

          case RequestState.error:
            return ShowError(networkExceptions: state.getProfileErrorMessage!);
        }
      },
    );
  }
}
