import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/address/add_or_delete_address.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';

class AddAddressUseCase
    extends BaseUseCase<AddOrDeleteAddress, AddAddressUseCaseParameters> {
  final HomeBaseRepository repository;

  AddAddressUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, AddOrDeleteAddress>> call(
      AddAddressUseCaseParameters parameters) async {
    return await repository.addAddress(parameters);
  }
}

class AddAddressUseCaseParameters extends Equatable {
  final String name;
  final String city;
  final String region;
  final String details;
  final String notes;

  const AddAddressUseCaseParameters({
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
  });

  @override
  List<Object> get props {
    return [
      name,
      city,
      region,
      details,
      notes,
    ];
  }
}
