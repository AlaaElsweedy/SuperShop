import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/services/service_locator.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/core/utils/token_secure_storage.dart';
import 'package:supershop/register/presentation/controller/bloc/register_bloc.dart';
import 'package:supershop/register/presentation/screens/home_screen.dart';
import '../../../general/components.dart';
import 'package:supershop/translations/locale_keys.g.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
        create: (context) => sl<RegisterBloc>(),
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            print(state);

            if (state.registerState == RequestState.success) {
              Navigator.of(context)
                  .pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
                (route) => false,
              )
                  .then((value) {
                TokenSecureStorage.saveSecureToken(
                  state.movieDetail!.registerData.token,
                );
              });

              print('token is:/// ${state.movieDetail!.registerData.token}');
            }

            // state.when(
            //   initial: () => showLoading(context),
            //   loading: () => showLoading(context),
            //   success: (register) {
            //     TokenSecureStorage.saveSecureToken(
            //       register.registerData.token,
            //     ).then((value) {
            //       navigateAndFinish(context, HomeScreen());
            //     });
            //   },
            //   error: (networkExceptions) {
            //     showError(
            //       context,
            //       networkExceptions,
            //     );
            //   },
            // );
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
                              title: LocaleKeys.haveAccount.tr(),
                            ),
                            CustomTextButton(
                              onPressed: () {},
                              child: LocaleKeys.signUp.tr(),
                            ),
                          ],
                        ),
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
                              8,
                              LocaleKeys.passwordLengthValidator.tr(),
                            ),
                          ]),
                          controller: passwordController,
                          type: TextInputType.text,
                        ),
                        AppSize.sizedBox15,
                        BlocBuilder<RegisterBloc, RegisterState>(
                          builder: (context, state) {
                            if (state.registerState == RequestState.isLoading) {
                              return showLoading();
                            }
                            print('Builder State $state');

                            return CustomButton(
                              title: LocaleKeys.signIn.tr(),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                  context.read<RegisterBloc>().add(
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
        ));
  }

  showLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  showError(NetworkExceptions errorMessage) {
    return Fluttertoast.showToast(
      msg: NetworkExceptions.getErrorMessage(errorMessage),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.primaryColorLight,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
