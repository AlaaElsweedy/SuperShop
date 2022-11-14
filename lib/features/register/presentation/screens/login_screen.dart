import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_validators/queen_validators.dart';
import '../../../../core/components/build_header.dart';
import '../../../../core/components/build_second_header.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/components/custom_text_button.dart';
import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/components/navigation.dart';
import '../../../../core/components/screen_status.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/constance.dart';
import '../../../../core/helpers/token_secure_storage_helper.dart';
import '../../../home/presentation/controllers/address/address_bloc.dart';
import '../../../home/presentation/controllers/cart/cart_bloc.dart';
import '../../../home/presentation/controllers/favorites/favorites_bloc.dart';
import '../../../home/presentation/controllers/home/home_bloc.dart';
import '../../../home/presentation/controllers/orders/orders_bloc.dart';
import '../../../home/presentation/controllers/profile/profile_bloc.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../components/login_password_field_component.dart';
import '../controller/login_bloc/login_bloc.dart';
import '../../../../generated/locale_keys.g.dart';
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
              token = register.registerData.token;
              TokenSecureStorageHelper.saveSecureToken(
                token!,
              ).then((value) {
                context.read<HomeBloc>().add(GetHomeDataEvent());
                context.read<FavoritesBloc>().add(GetFavoriteProductEvent());
                context.read<CartBloc>().add(GetCartProductsEvent());
                context.read<AddressBloc>().add(GetAddressesEvent());
                context.read<OrdersBloc>().add(GetOrdersEvent());
                context.read<ProfileBloc>().add(GetProfileEvent());
                navigateAndFinish(context, HomeScreen());
              });
              //print('token is:/// ${register.registerData.token}');
            },
            error: (networkExceptions) {
              showToastExceptionError(
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
                          AppSize.sizedBoxW5(context),
                          CustomTextButton(
                            onPressed: () {
                              navigateTo(context, SignUpScreen());
                            },
                            title: LocaleKeys.signUp.tr(),
                          ),
                        ],
                      ),
                      AppSize.sizedBox28(context),
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
                      LoginPasswordFieldComponent(
                        passwordController: passwordController,
                      ),
                      AppSize.sizedBox15(context),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          //print('Login Screen $state');
                          if (state is LoginLoadingState) {
                            return const ShowCircularLoading();
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
