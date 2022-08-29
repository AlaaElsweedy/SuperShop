import 'package:dartz/dartz.dart';
import 'package:supershop/features/home/domain/entities/categories/categories.dart';
import 'package:supershop/features/home/domain/entities/favorites/get_favorite_products.dart';
import 'package:supershop/features/home/domain/entities/favorites/post_favorites.dart';
import 'package:supershop/features/home/domain/entities/home/home.model.dart';
import 'package:supershop/features/home/domain/usecases/add_product_to_favorite_usecase.dart';
import '../../../../../core/error/network_exceptions.dart';

abstract class HomeBaseRepository {
  Future<Either<NetworkExceptions, Home>> getHomeData();
  Future<Either<NetworkExceptions, Categories>> getCategories();
  Future<Either<NetworkExceptions, PostFavorite>> changeFavoriteProductsStatus(
    AddProductToFavoriteUseCaseParameters parameters,
  );
  Future<Either<NetworkExceptions, GetFavoriteProducts>> getFavoriteProducts();
}
