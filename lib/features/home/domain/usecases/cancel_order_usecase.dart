import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/orders/cancel_orders.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';

class CancelOrderUseCase
    extends BaseUseCase<CancelOrder, CancelOrderUseCaseParameters> {
  final HomeBaseRepository repository;

  CancelOrderUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, CancelOrder>> call(
      CancelOrderUseCaseParameters parameters) async {
    return await repository.cancelOrder(parameters);
  }
}

class CancelOrderUseCaseParameters extends Equatable {
  final int orderId;

  const CancelOrderUseCaseParameters({
    required this.orderId,
  });

  @override
  List<Object> get props => [orderId];
}
