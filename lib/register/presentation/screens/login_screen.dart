import 'package:buildcondition/buildcondition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/services/service_locator.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/core/utils/token_secure_storage.dart';
import 'package:supershop/register/presentation/controller/bloc/register_bloc.dart';
import 'package:supershop/register/presentation/screens/home_screen.dart';
import 'package:supershop/register/presentation/screens/on_boarding_screen.dart';
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
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state.registerState == RequestState.success) {
              TokenSecureStorage.saveSecureToken(
                state.movieDetail!.registerData.token,
              ).then((value) {
                navigateAndFinish(context, HomeScreen());
              });
              print('token is:/// ${state.movieDetail!.registerData.token}');
            }

            switch (state.registerState) {
              case RequestState.isLoading:
                showLoading(context);
                break;

              case RequestState.success:
                // navigateAndFinish(context, HomeScreen());
                break;

              case RequestState.error:
                showError(
                  context,
                  state.networkExceptions!,
                );
                break;
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
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
                              title: LocaleKeys.have_account.tr(),
                            ),
                            CustomTextButton(
                              onPressed: () {},
                              child: LocaleKeys.sign_up.tr(),
                            ),
                          ],
                        ),
                        CustomTextFormField(
                          context: context,
                          hintText: LocaleKeys.email.tr(),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          controller: emailController,
                          type: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 15.0),
                        CustomTextFormField(
                          context: context,
                          hintText: LocaleKeys.password.tr(),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          controller: passwordController,
                          type: TextInputType.text,
                        ),
                        BuildCondition(
                          condition:
                              state.registerState == RequestState.isLoading,
                          builder: (context) => CustomButton(
                            title: LocaleKeys.signIn.tr(),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                context.read<RegisterBloc>().add(
                                      UserSignInEvent(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                              }
                            },
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }

  Widget showLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  showError(BuildContext context, NetworkExceptions errorMessage) {
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
