import 'package:dartz/dartz.dart';

import '../../../../core/error/network_exceptions.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/home/get_home.dart';
import '../repository/home_base_repository.dart';

class GetHomeDataUseCase extends BaseUseCase<GetHome, NoParameters> {
  final HomeBaseRepository homeBaseRepository;

  GetHomeDataUseCase(this.homeBaseRepository);

  @override
  Future<Either<NetworkExceptions, GetHome>> call(
      NoParameters parameters) async {
    return await homeBaseRepository.getHomeData();
  }
}
