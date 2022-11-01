import 'package:dartz/dartz.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/address/get_address.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';

class GetAddressUseCase extends BaseUseCase<GetAddress, NoParameters> {
  final HomeBaseRepository repository;

  GetAddressUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, GetAddress>> call(
      NoParameters parameters) async {
    return await repository.getAddress();
  }
}
