import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supershop/core/utils/enums.dart';
import '../../../../core/error/network_exceptions.dart';
import '../../../domain/entities/register.dart';
import '../../../domain/usecases/user_login_usecase.dart';
import '../../../domain/usecases/user_sign_up_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';
//part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserLoginUseCase userLoginUseCase;
  final UserSignUpUseCase userSignUpUseCase;

  RegisterBloc(
    this.userLoginUseCase,
    this.userSignUpUseCase,
  ) : super(const RegisterState()) {
    on<UserSignUpEvent>(_userSignUp);
    on<UserSignInEvent>(_userLogin);
  }

  FutureOr<void> _userLogin(
    UserSignInEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(registerState: RequestState.isLoading));

    final result = await userLoginUseCase(
      UserLoginParameters(
        email: event.email,
        password: event.password,
      ),
    );

    result.fold((l) {
      emit(state.copyWith(
        registerState: RequestState.error,
        networkExceptions: l,
      ));
    }, (r) {
      emit(state.copyWith(
        registerState: RequestState.success,
        movieDetail: r,
      ));
    });
  }

  FutureOr<void> _userSignUp(
      UserSignUpEvent event, Emitter<RegisterState> emit) async {
    final result = await userSignUpUseCase(
      UserSignUpParameters(
        name: event.name,
        phone: event.phone,
        email: event.email,
        password: event.password,
      ),
    );
    result.fold((l) {
      emit(state.copyWith(
        registerState: RequestState.error,
        networkExceptions: l,
      ));
    }, (r) {
      emit(state.copyWith(
        registerState: RequestState.success,
        movieDetail: r,
      ));
    });
  }
}
