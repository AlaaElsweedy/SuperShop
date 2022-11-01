import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/orders/add_order.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';

class AddOrderUseCase extends BaseUseCase<AddOrder, AddOrderUseCaseParameters> {
  final HomeBaseRepository repository;

  AddOrderUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, AddOrder>> call(
      AddOrderUseCaseParameters parameters) async {
    return await repository.addOrder(parameters);
  }
}

class AddOrderUseCaseParameters extends Equatable {
  final int addressId;

  const AddOrderUseCaseParameters({
    required this.addressId,
  });

  @override
  List<Object> get props => [addressId];
}
