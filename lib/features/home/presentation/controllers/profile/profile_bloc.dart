import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/features/home/domain/entities/profile/get_or_update_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<GetProfileEvent>(_getProfile);
  }

  FutureOr<void> _getProfile(
      GetProfileEvent event, Emitter<ProfileState> emit) {}
}
