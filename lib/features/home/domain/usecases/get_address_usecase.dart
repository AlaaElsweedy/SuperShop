import 'package:dartz/dartz.dart';
import '../../../../core/error/network_exceptions.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/address/get_address.dart';
import '../repository/home_base_repository.dart';

class GetAddressUseCase extends BaseUseCase<GetAddress, NoParameters> {
  final HomeBaseRepository repository;

  GetAddressUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, GetAddress>> call(
      NoParameters parameters) async {
    return await repository.getAddress();
  }
}
