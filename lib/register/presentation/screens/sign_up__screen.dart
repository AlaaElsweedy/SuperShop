import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/services/service_locator.dart';
import 'package:supershop/register/presentation/controller/bloc/register_bloc.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey formState = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => sl<RegisterBloc>(),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: AnnotatedRegion<SystemUiOverlayStyle>(
                value: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Form(
                        key: formState,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Already have an account?',
                                  style: TextStyle(),
                                ),
                                const SizedBox(
                                  width: 0,
                                ),
                                TextButton(
                                    style: const ButtonStyle(),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Sign In!',
                                      style: TextStyle(
                                          color: Colors.indigo,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: fullNameController,
                              cursorColor: Colors.indigo,
                              keyboardType: TextInputType.text,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Full Name',
                                // prefixIcon: Icon(IconBroken.Profile),
                                // enabledBorder: enabledBorder,
                                // focusedBorder: focusedBorder,
                                // errorBorder: enabledBorder,
                                // focusedErrorBorder: focusedBorder,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: emailController,
                              cursorColor: Colors.indigo,
                              keyboardType: TextInputType.emailAddress,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Email',
                                // prefixIcon: Icon(IconBroken.Message),
                                // enabledBorder: enabledBorder,
                                // focusedBorder: focusedBorder,
                                // errorBorder: enabledBorder,
                                // focusedErrorBorder: focusedBorder,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passwordController,
                              cursorColor: Colors.indigo,
                              keyboardType: TextInputType.visiblePassword,
                              //obscureText: RegisterCubit.get(context).isShowPassword,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Password is too short';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.security_rounded),
                                suffixIcon: InkWell(
                                  onTap: () {},
                                ),
                                // enabledBorder: enabledBorder,
                                // focusedBorder: focusedBorder,
                                // errorBorder: enabledBorder,
                                // focusedErrorBorder: focusedBorder,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: phoneController,
                              cursorColor: Colors.indigo,
                              keyboardType: TextInputType.phone,
                              maxLength: 11,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your phone number';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Phone',
                                // prefixIcon: Icon(IconBroken.Call),
                                // enabledBorder: enabledBorder,
                                // focusedBorder: focusedBorder,
                                // errorBorder: enabledBorder,
                                // focusedErrorBorder: focusedBorder,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            // gradientButton(
                            //   context: context,
                            //   onPressed: () {
                            //     if (formState.currentState.validate()) {
                            //       RegisterCubit.get(context).userRegister(
                            //         email: emailController.text,
                            //         password: passwordController.text,
                            //         phone: phoneController.text,
                            //         name: fullNameController.text,
                            //       );
                            //     }
                            //   },
                            //   title: Text(
                            //     'Sign Up',
                            //     style: TextStyle(color: Colors.white, fontSize: 16),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
