import 'package:supershop/core/error/network_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/home/domain/entities/home.model.dart';
import 'package:supershop/home/domain/repository/home_base_repository.dart';

class GetHomeDataUseCase extends BaseUseCase<Home, NoParameters> {
  final HomeBaseRepository homeBaseRepository;

  GetHomeDataUseCase(this.homeBaseRepository);

  @override
  Future<Either<NetworkExceptions, Home>> call(NoParameters parameters) async {
    return await homeBaseRepository.getHomeData();
  }
}
