import 'package:dartz/dartz.dart';
import '../../../../core/error/network_exceptions.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/profile/get_profile.dart';
import '../repository/home_base_repository.dart';

class GetProfileUseCase extends BaseUseCase<GetProfile, NoParameters> {
  final HomeBaseRepository repository;

  GetProfileUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, GetProfile>> call(
      NoParameters parameters) async {
    return await repository.getProfile();
  }
}
