import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_validators/queen_validators.dart';
import '../../../../core/components/custom_app_bar.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/components/screen_status.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/enums.dart';
import '../controllers/profile/profile_bloc.dart';
import '../../../../generated/locale_keys.g.dart';

class ChangePasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: AppSize.paddingAll20,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.changePassword.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  AppSize.sizedBox15(context),
                  CustomTextFormField(
                    context: context,
                    hintText: LocaleKeys.currentPassword.tr(),
                    validator: qValidator([
                      IsRequired(LocaleKeys.requiredField.tr()),
                    ]),
                    controller: currentPassController,
                    type: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_open),
                  ),
                  AppSize.sizedBox10(context),
                  CustomTextFormField(
                    context: context,
                    hintText: LocaleKeys.newPassword.tr(),
                    validator: (value) {
                      if (value!.length < 8) {
                        return LocaleKeys.requiredField.tr();
                      }
                      if (newPassController.text ==
                          currentPassController.text) {
                        return LocaleKeys.differentPassword.tr();
                      }
                      return null;
                    },
                    controller: newPassController,
                    type: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_open),
                  ),
                  AppSize.sizedBox10(context),
                  CustomTextFormField(
                    context: context,
                    hintText: LocaleKeys.confirmPassword.tr(),
                    validator: (value) {
                      if (value!.length < 8) {
                        return LocaleKeys.passwordLengthValidator.tr();
                      }
                      if (newPassController.text !=
                          confirmPassController.text) {
                        return LocaleKeys.passwordMatch.tr();
                      }
                      return null;
                    },
                    controller: confirmPassController,
                    type: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_open),
                  ),
                  AppSize.sizedBox15(context),
                  BlocConsumer<ProfileBloc, ProfileState>(
                    listener: (context, state) {
                      if (state.changePasswordState == RequestState.success) {
                        if (state.changePassword!.status) {
                          showToastSuccessMessage(
                            state.changePassword!.message,
                          );
                          currentPassController.clear();
                          newPassController.clear();
                          confirmPassController.clear();
                        } else {
                          showToastErrorMessage(
                            state.changePassword!.message,
                          );
                        }
                        Navigator.of(context).pop();
                      }

                      if (state.changePasswordState == RequestState.error) {
                        ShowError(
                          networkExceptions: state.changePasswordErrorMessage!,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state.changePasswordState == RequestState.isLoading) {
                        return const ShowCircularLoading();
                      }

                      return CustomButton(
                        title: LocaleKeys.save.tr(),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            context.read<ProfileBloc>().add(ChangePasswordEvent(
                                  currentPassword: currentPassController.text,
                                  newPassword: newPassController.text,
                                ));
                          }
                        },
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
