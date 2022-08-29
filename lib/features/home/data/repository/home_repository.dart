import 'package:dartz/dartz.dart';
import 'package:supershop/core/error/exception.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/features/home/domain/entities/categories/categories.dart';
import 'package:supershop/features/home/domain/entities/favorites/get_favorite_products.dart';
import 'package:supershop/features/home/domain/entities/favorites/post_favorites.dart';
import 'package:supershop/features/home/domain/entities/home/home.model.dart';

import '../datasource/home_remote_data_source.dart';
import '../../domain/repository/home_base_repository.dart';
import '../../domain/usecases/add_product_to_favorite_usecase.dart';

class HomeRepository extends HomeBaseRepository {
  HomeBaseRemoteDataSource repository;

  HomeRepository({
    required this.repository,
  });

  @override
  Future<Either<NetworkExceptions, Home>> getHomeData() async {
    try {
      final result = await repository.getHomeData();
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, Categories>> getCategories() async {
    try {
      final result = await repository.getCategories();
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, PostFavorite>> changeFavoriteProductsStatus(
    AddProductToFavoriteUseCaseParameters parameters,
  ) async {
    try {
      final result = await repository.changeFavoriteProductsStatus(parameters);
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, GetFavoriteProducts>>
      getFavoriteProducts() async {
    try {
      final result = await repository.getFavoriteProducts();
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }
}
