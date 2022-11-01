import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/custom_button.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/features/register/presentation/controller/register_bloc/register_bloc.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class SignUpCustomButtonComponent extends StatelessWidget {
  const SignUpCustomButtonComponent({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.fullNameController,
    required this.passwordController,
    required this.phoneController,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController fullNameController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
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
    );
  }
}
