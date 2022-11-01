import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/cart/update_or_delete_cart_products.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';

class DeleteCartProductsUseCase extends BaseUseCase<UpdateOrDeleteCartProducts,
    DeleteCartProductsUseCaseParameters> {
  final HomeBaseRepository repository;

  DeleteCartProductsUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, UpdateOrDeleteCartProducts>> call(
      DeleteCartProductsUseCaseParameters parameters) async {
    return await repository.deleteCartProducts(parameters);
  }
}

class DeleteCartProductsUseCaseParameters extends Equatable {
  final int cartId;
  const DeleteCartProductsUseCaseParameters({
    required this.cartId,
  });

  @override
  List<Object> get props => [cartId];
}
