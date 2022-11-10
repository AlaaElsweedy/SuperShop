import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/features/home/domain/entities/profile/change_password.dart';
import 'package:supershop/features/home/domain/entities/profile/get_profile.dart';
import 'package:supershop/features/home/domain/entities/profile/sign_out.dart';
import 'package:supershop/features/home/domain/entities/profile/update_profile.dart';
import 'package:supershop/features/home/domain/usecases/change_password_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_profile_usecase.dart';
import 'package:supershop/features/home/domain/usecases/sign_out_usecase.dart';
import 'package:supershop/features/home/domain/usecases/update_profile_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final SignOutUseCase signOutUseCase;
  final ChangePasswordUseCase changePasswordUseCase;

  ProfileBloc(
    this.getProfileUseCase,
    this.updateProfileUseCase,
    this.signOutUseCase,
    this.changePasswordUseCase,
  ) : super(const ProfileState()) {
    on<GetProfileEvent>(_getProfile);
    on<UpdateProfileEvent>(_updateProfile);
    on<SignOutEvent>(_signOut);
    on<ChangePasswordEvent>(_changePassword);
  }

  FutureOr<void> _getProfile(
      GetProfileEvent event, Emitter<ProfileState> emit) async {
    final result = await getProfileUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
        getProfileErrorMessage: l,
        getProfileState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        getProfile: r,
        getProfileState: RequestState.success,
      ));
    });
  }

  FutureOr<void> _updateProfile(
      UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(updateProfileState: RequestState.isLoading));

    final result = await updateProfileUseCase(UpdateProfileUseCaseParameters(
      name: event.name,
      phone: event.phoneNumber,
      email: event.email,
    ));
    result.fold((l) {
      emit(state.copyWith(
        updateProfileErrorMessage: l,
        updateProfileState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        updateProfile: r,
        updateProfileState: RequestState.success,
      ));
      add(GetProfileEvent());
    });
  }

  FutureOr<void> _signOut(
      SignOutEvent event, Emitter<ProfileState> emit) async {
    final result =
        await signOutUseCase(SignOutUseCaseParameters(token: event.token));
    result.fold((l) {
      emit(state.copyWith(
        signOutErrorMessage: l,
        signOutState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        signOut: r,
        signOutState: RequestState.success,
      ));
    });
  }

  FutureOr<void> _changePassword(
      ChangePasswordEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(changePasswordState: RequestState.isLoading));

    final result = await changePasswordUseCase(ChangePasswordUseCaseParameters(
      currentPassword: event.currentPassword,
      newPassword: event.newPassword,
    ));
    result.fold((l) {
      emit(state.copyWith(
        changePasswordErrorMessage: l,
        changePasswordState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        changePassword: r,
        changePasswordState: RequestState.success,
      ));
    });
  }
}
