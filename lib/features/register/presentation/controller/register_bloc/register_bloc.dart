import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supershop/core/error/network_exceptions.dart';

import '../../../domain/usecases/user_sign_up_usecase.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserSignUpUseCase userSignUpUseCase;

  RegisterBloc(
    this.userSignUpUseCase,
  ) : super(const RegisterInitialState()) {
    on<UserSignUpEvent>(_userSignUp);
  }

  FutureOr<void> _userSignUp(
    UserSignUpEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(const RegisterLoadingState());

    final result = await userSignUpUseCase(
      UserSignUpParameters(
        name: event.name,
        phone: event.phone,
        email: event.email,
        password: event.password,
      ),
    );
    result.fold((l) {
      emit(RegisterState.error(l));
    }, (r) {
      emit(const RegisterState.success());
    });
  }
}
