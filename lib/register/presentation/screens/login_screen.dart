import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:supershop/core/services/service_locator.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/token_secure_storage.dart';
import 'package:supershop/home/presentation/screens/home_screen.dart';
import 'package:supershop/register/presentation/controller/bloc/login_bloc.dart';
import 'package:supershop/register/presentation/screens/sign_up__screen.dart';
import '../../../general/components.dart';
import 'package:supershop/translations/locale_keys.g.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => sl<LoginBloc>(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          state.when(
            initial: () => showLoading(),
            loading: () => showLoading(),
            success: (register) {
              TokenSecureStorage.saveSecureToken(
                register.registerData.token,
              ).then((value) {
                navigateAndFinish(context, HomeScreen());
              });
              print('token is:/// ${register.registerData.token}');
            },
            error: (networkExceptions) {
              showError(
                networkExceptions,
              );
            },
          );
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: AppSize.paddingAll,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BuildHeader(
                        title: LocaleKeys.signIn.tr(),
                      ),
                      Row(
                        children: [
                          BuildSecondHeader(
                            title: LocaleKeys.haveNotAccount.tr(),
                          ),
                          CustomTextButton(
                            onPressed: () {
                              navigateTo(context, SignUpScreen());
                            },
                            child: LocaleKeys.signUp.tr(),
                          ),
                        ],
                      ),
                      AppSize.sizedBox28,
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
                          MinLength(8, LocaleKeys.passwordLengthValidator.tr()),
                        ]),
                        controller: passwordController,
                        type: TextInputType.text,
                      ),
                      AppSize.sizedBox15,
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          print('Login Screen $state');
                          if (state is LoginLoadingState) {
                            return showLoading();
                          }

                          return CustomButton(
                            title: LocaleKeys.signIn.tr(),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                context.read<LoginBloc>().add(
                                      UserSignInEvent(
                                        emailController.text,
                                        passwordController.text,
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
    );
  }
}
