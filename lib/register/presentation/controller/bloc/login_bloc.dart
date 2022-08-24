import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/register/domain/entities/register.dart';
import 'package:supershop/register/domain/usecases/user_login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserLoginUseCase userLoginUseCase;

  LoginBloc(this.userLoginUseCase) : super(const LoginInitialState()) {
    on<UserSignInEvent>(_userLogin);
  }

  FutureOr<void> _userLogin(
    UserSignInEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoadingState());

    final result = await userLoginUseCase(
      UserLoginParameters(
        email: event.email,
        password: event.password,
      ),
    );

    result.fold((l) {
      emit(LoginState.error(l));
    }, (r) {
      emit(LoginState.success(r));
    });
  }
}
