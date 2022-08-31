import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'password_visibility_state.dart';

class PasswordVisibilityBloc extends Cubit<PasswordVisibilityStates> {
  PasswordVisibilityBloc() : super(PasswordVisibilityInitialState());

  static PasswordVisibilityBloc get(context) => BlocProvider.of(context);

  bool isPasswordHidden = false;
  IconData suffixIcon = Icons.visibility_off_outlined;

  void passwordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    suffixIcon = isPasswordHidden
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(TogglePasswordVisibilityState());
  }
}
