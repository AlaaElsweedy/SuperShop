import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/network_exceptions.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/cart/update_or_delete_cart_products.dart';
import '../repository/home_base_repository.dart';

class UpdateCartProductsUseCase extends BaseUseCase<UpdateOrDeleteCartProducts,
    UpdateCartProductsUseCaseParameters> {
  final HomeBaseRepository repository;

  UpdateCartProductsUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, UpdateOrDeleteCartProducts>> call(
      UpdateCartProductsUseCaseParameters parameters) async {
    return await repository.updateCartProducts(parameters);
  }
}

class UpdateCartProductsUseCaseParameters extends Equatable {
  final int cartId;
  final int quantity;
  const UpdateCartProductsUseCaseParameters({
    required this.cartId,
    required this.quantity,
  });

  @override
  List<Object> get props => [cartId, quantity];
}
