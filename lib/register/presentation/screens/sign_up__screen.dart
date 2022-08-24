import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:supershop/core/services/service_locator.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/general/components.dart';
import 'package:supershop/register/presentation/controller/bloc/register_bloc.dart';
import 'package:supershop/register/presentation/screens/login_screen.dart';
import 'package:supershop/translations/locale_keys.g.dart';

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
            initial: () => showLoading(),
            loading: () => showLoading(),
            success: () => navigateTo(context, LoginScreen()),
            error: (networkExceptions) => showError(networkExceptions),
          );
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: AppSize.paddingAll,
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
                              child: LocaleKeys.signIn.tr(),
                            ),
                          ],
                        ),
                        AppSize.sizedBox28,
                        CustomTextFormField(
                          context: context,
                          hintText: LocaleKeys.fullName.tr(),
                          validator: qValidator([
                            IsRequired(LocaleKeys.requiredField.tr()),
                          ]),
                          controller: fullNameController,
                          type: TextInputType.name,
                        ),
                        AppSize.sizedBox15,
                        CustomTextFormField(
                          context: context,
                          hintText: LocaleKeys.email.tr(),
                          validator: qValidator([
                            IsRequired(LocaleKeys.emailValidator.tr()),
                            IsEmail(LocaleKeys.emailAddressFormat.tr()),
                          ]),
                          controller: emailController,
                          type: TextInputType.emailAddress,
                        ),
                        AppSize.sizedBox15,
                        CustomTextFormField(
                          context: context,
                          hintText: LocaleKeys.password.tr(),
                          validator: qValidator([
                            IsRequired(LocaleKeys.passwordValidator.tr()),
                            MinLength(
                                8, LocaleKeys.passwordLengthValidator.tr()),
                          ]),
                          controller: passwordController,
                          type: TextInputType.text,
                        ),
                        AppSize.sizedBox15,
                        CustomTextFormField(
                          context: context,
                          hintText: LocaleKeys.phone.tr(),
                          validator: qValidator([
                            IsRequired(LocaleKeys.requiredField.tr()),
                            IsEgyptianPhone(LocaleKeys.isPhoneNumber.tr()),
                          ]),
                          controller: phoneController,
                          type: TextInputType.phone,
                        ),
                        AppSize.sizedBox15,
                        BlocBuilder<RegisterBloc, RegisterState>(
                          builder: (context, state) {
                            print('Sign Up Screen $state');
                            if (state is RegisterLoadingState) {
                              return showLoading();
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
