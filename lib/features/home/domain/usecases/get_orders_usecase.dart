import 'package:supershop/core/error/network_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/orders/get_orders.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';

class GetOrdersUseCase extends BaseUseCase<GetOrders, NoParameters> {
  final HomeBaseRepository repository;

  GetOrdersUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, GetOrders>> call(
      NoParameters parameters) async {
    return await repository.getOrders();
  }
}
