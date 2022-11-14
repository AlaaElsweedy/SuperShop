import 'package:dartz/dartz.dart';

import '../../../../core/error/network_exceptions.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/cart/get_cart_products.dart';
import '../repository/home_base_repository.dart';

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
