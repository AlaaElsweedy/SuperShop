import '../../../../core/error/network_exceptions.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/orders/get_orders.dart';
import '../repository/home_base_repository.dart';

class GetOrdersUseCase extends BaseUseCase<GetOrders, NoParameters> {
  final HomeBaseRepository repository;

  GetOrdersUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, GetOrders>> call(
      NoParameters parameters) async {
    return await repository.getOrders();
  }
}
