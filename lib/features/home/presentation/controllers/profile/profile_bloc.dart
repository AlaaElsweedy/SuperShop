import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/features/home/domain/entities/profile/get_profile.dart';
import 'package:supershop/features/home/domain/entities/profile/update_profile.dart';
import 'package:supershop/features/home/domain/usecases/get_profile_usecase.dart';
import 'package:supershop/features/home/domain/usecases/update_profile_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileBloc(
    this.getProfileUseCase,
    this.updateProfileUseCase,
  ) : super(const ProfileState()) {
    on<GetProfileEvent>(_getProfile);
    on<UpdateProfileEvent>(_updateProfile);
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
}
