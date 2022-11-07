import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/profile/update_profile.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';

class UpdateProfileUseCase
    extends BaseUseCase<UpdateProfile, UpdateProfileUseCaseParameters> {
  final HomeBaseRepository repository;

  UpdateProfileUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, UpdateProfile>> call(
      UpdateProfileUseCaseParameters parameters) async {
    return await repository.updateProfile(parameters);
  }
}

class UpdateProfileUseCaseParameters extends Equatable {
  final String name;
  final String phone;
  final String email;

  const UpdateProfileUseCaseParameters({
    required this.name,
    required this.phone,
    required this.email,
  });

  @override
  List<Object> get props {
    return [
      name,
      phone,
      email,
    ];
  }
}
