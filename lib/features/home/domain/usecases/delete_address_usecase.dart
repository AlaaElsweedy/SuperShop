import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/address/add_or_delete_address.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';

class DeleteAddressUseCase
    extends BaseUseCase<AddOrDeleteAddress, DeleteAddressUseCaseParameters> {
  final HomeBaseRepository repository;

  DeleteAddressUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, AddOrDeleteAddress>> call(
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
