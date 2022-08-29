import 'package:dartz/dartz.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/home/home.model.dart';

import '../repository/home_base_repository.dart';

class GetHomeDataUseCase extends BaseUseCase<Home, NoParameters> {
  final HomeBaseRepository homeBaseRepository;

  GetHomeDataUseCase(this.homeBaseRepository);

  @override
  Future<Either<NetworkExceptions, Home>> call(NoParameters parameters) async {
    return await homeBaseRepository.getHomeData();
  }
}
