import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/custom_button_component.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/features/register/presentation/controller/login_bloc/login_bloc.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class LoginCustomButtonComponent extends StatelessWidget {
  const LoginCustomButtonComponent({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
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
    );
  }
}
