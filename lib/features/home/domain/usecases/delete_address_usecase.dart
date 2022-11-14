import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/network_exceptions.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/address/address.dart';
import '../repository/home_base_repository.dart';

class DeleteAddressUseCase
    extends BaseUseCase<Address, DeleteAddressUseCaseParameters> {
  final HomeBaseRepository repository;

  DeleteAddressUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, Address>> call(
      DeleteAddressUseCaseParameters parameters) async {
    return await repository.deleteAddress(parameters);
  }
}

class DeleteAddressUseCaseParameters extends Equatable {
  final int addressId;
  const DeleteAddressUseCaseParameters({
    required this.addressId,
  });

  @override
  List<Object> get props => [addressId];
}
