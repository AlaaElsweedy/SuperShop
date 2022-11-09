import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:supershop/core/components/build_header.dart';
import 'package:supershop/core/components/build_second_header.dart';
import 'package:supershop/core/components/custom_button.dart';
import 'package:supershop/core/components/custom_text_button.dart';
import 'package:supershop/core/components/custom_text_form_field.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/services/service_locator.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/features/register/presentation/components/sign_up_password_field_component.dart';
import 'package:supershop/features/register/presentation/controller/register_bloc/register_bloc.dart';
import 'package:supershop/generated/locale_keys.g.dart';

import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => sl<RegisterBloc>(),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          state.when(
            initial: () => const ShowCircularLoading(),
            loading: () => const ShowCircularLoading(),
            success: () => navigateTo(context, LoginScreen()),
            error: (networkExceptions) => showToastError(networkExceptions),
          );
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: AppSize.paddingAll20,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildHeader(
                          title: LocaleKeys.signUp.tr(),
                        ),
                        Row(
                          children: [
                            BuildSecondHeader(
                              title: LocaleKeys.haveAccount.tr(),
                            ),
                            CustomTextButton(
                              onPressed: () {
                                navigateTo(context, LoginScreen());
                              },
                              title: LocaleKeys.signIn.tr(),
                            ),
                          ],
                        ),
                        AppSize.sizedBox28(context),
                        CustomTextFormField(
                          prefixIcon: const Icon(Icons.person),
                          context: context,
                          hintText: LocaleKeys.fullName.tr(),
                          validator: qValidator([
                            IsRequired(LocaleKeys.requiredField.tr()),
                          ]),
                          controller: fullNameController,
                          type: TextInputType.name,
                        ),
                        AppSize.sizedBox15(context),
                        CustomTextFormField(
                          prefixIcon: const Icon(Icons.email),
                          context: context,
                          hintText: LocaleKeys.email.tr(),
                          validator: qValidator([
                            IsRequired(LocaleKeys.emailValidator.tr()),
                            IsEmail(LocaleKeys.emailAddressFormat.tr()),
                          ]),
                          controller: emailController,
                          type: TextInputType.emailAddress,
                        ),
                        AppSize.sizedBox15(context),
                        SignUpPasswordFieldComponent(
                          passwordController: passwordController,
                        ),
                        AppSize.sizedBox15(context),
                        CustomTextFormField(
                          prefixIcon: const Icon(Icons.phone),
                          context: context,
                          hintText: LocaleKeys.phone.tr(),
                          validator: qValidator([
                            IsRequired(LocaleKeys.requiredField.tr()),
                            IsEgyptianPhone(LocaleKeys.isPhoneNumber.tr()),
                          ]),
                          controller: phoneController,
                          type: TextInputType.phone,
                        ),
                        AppSize.sizedBox15(context),
                        BlocBuilder<RegisterBloc, RegisterState>(
                          builder: (context, state) {
                            //print('Sign Up Screen $state');
                            if (state is RegisterLoadingState) {
                              return const ShowCircularLoading();
                            }

                            return CustomButton(
                              title: LocaleKeys.signUp.tr(),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                  context.read<RegisterBloc>().add(
                                        UserSignUpEvent(
                                          emailController.text,
                                          fullNameController.text,
                                          passwordController.text,
                                          phoneController.text,
                                        ),
                                      );
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
          ),
        ),
      ),
    );
  }
}
