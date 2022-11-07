import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:supershop/core/components/build_header.dart';
import 'package:supershop/core/components/build_second_header.dart';
import 'package:supershop/core/components/custom_text_button.dart';
import 'package:supershop/core/components/custom_text_form_field.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/services/service_locator.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/constance.dart';
import 'package:supershop/core/utils/token_secure_storage.dart';
import 'package:supershop/features/home/presentation/screens/home_screen.dart';
import 'package:supershop/features/register/presentation/components/login_custom_button_component.dart';
import 'package:supershop/features/register/presentation/components/login_password_field_component.dart';
import 'package:supershop/features/register/presentation/controller/login_bloc/login_bloc.dart';
import 'package:supershop/generated/locale_keys.g.dart';
import 'sign_up_screen.dart';

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
            initial: () => const ShowCircularLoading(),
            loading: () => const ShowCircularLoading(),
            success: (register) {
              TokenSecureStorage.saveSecureToken(
                register.registerData.token,
              ).then((value) {
                token = register.registerData.token;
                navigateAndFinish(context, HomeScreen());
              });
              //print('token is:/// ${register.registerData.token}');
            },
            error: (networkExceptions) {
              showToastError(
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
                  padding: AppSize.paddingAll20,
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
                            title: LocaleKeys.signUp.tr(),
                          ),
                        ],
                      ),
                      AppSize.sizedBox28,
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
                      AppSize.sizedBox15,
                      LoginPasswordFieldComponent(
                        passwordController: passwordController,
                      ),
                      AppSize.sizedBox15,
                      LoginCustomButtonComponent(
                        formKey: _formKey,
                        emailController: emailController,
                        passwordController: passwordController,
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
