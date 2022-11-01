import 'package:supershop/core/error/network_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/cart/get_cart_products.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';

class GetCartProductsUseCase
    extends BaseUseCase<GetCartProducts, NoParameters> {
  final HomeBaseRepository repository;

  GetCartProductsUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, GetCartProducts>> call(
      NoParameters parameters) async {
    return await repository.getCartProducts();
  }
}
