import 'package:supershop/core/error/network_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/favorites/get_favorite_products.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';

class GetFavoriteProductsUseCase
    extends BaseUseCase<GetFavoriteProducts, NoParameters> {
  final HomeBaseRepository homeBaseRepository;

  GetFavoriteProductsUseCase(this.homeBaseRepository);

  @override
  Future<Either<NetworkExceptions, GetFavoriteProducts>> call(
    NoParameters parameters,
  ) async {
    return await homeBaseRepository.getFavoriteProducts();
  }
}
