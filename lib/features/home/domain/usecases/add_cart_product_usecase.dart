import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/cart/post_cart_product.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';

class AddCartProductUseCase
    extends BaseUseCase<PostCartProduct, AddCartProductUseCaseParameters> {
  final HomeBaseRepository repository;

  AddCartProductUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, PostCartProduct>> call(
    AddCartProductUseCaseParameters parameters,
  ) async {
    return await repository.addCartProduct(parameters);
  }
}

class AddCartProductUseCaseParameters extends Equatable {
  final String productId;

  const AddCartProductUseCaseParameters({
    required this.productId,
  });

  @override
  List<Object> get props => [productId];
}
