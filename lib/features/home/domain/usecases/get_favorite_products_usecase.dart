import 'package:dartz/dartz.dart';

import '../../../../core/error/network_exceptions.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/favorites/get_favorite_products.dart';
import '../repository/home_base_repository.dart';

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
