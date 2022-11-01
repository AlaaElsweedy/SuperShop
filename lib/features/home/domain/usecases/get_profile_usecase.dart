import 'package:dartz/dartz.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/profile/get_or_update_profile.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';

class GetProfileUseCase extends BaseUseCase<GetOrUpdateProfile, NoParameters> {
  final HomeBaseRepository repository;

  GetProfileUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, GetOrUpdateProfile>> call(
      NoParameters parameters) async {
    return await repository.getProfile();
  }
}
