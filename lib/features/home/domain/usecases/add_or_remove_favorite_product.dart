import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/favorites/post_favorite_products.dart';
import '../repository/home_base_repository.dart';

class AddOrRemoveFavoriteProductUseCase extends BaseUseCase<
    PostFavoriteProducts, AddOrRemoveFavoriteProductUseCaseParameters> {
  final HomeBaseRepository homeBaseRepository;

  AddOrRemoveFavoriteProductUseCase(this.homeBaseRepository);

  @override
  Future<Either<NetworkExceptions, PostFavoriteProducts>> call(
    AddOrRemoveFavoriteProductUseCaseParameters parameters,
  ) async {
    return await homeBaseRepository.addOrRemoveFavoriteProduct(parameters);
  }
}

class AddOrRemoveFavoriteProductUseCaseParameters extends Equatable {
  final int productId;

  const AddOrRemoveFavoriteProductUseCaseParameters(this.productId);

  @override
  List<Object> get props => [productId];
}
