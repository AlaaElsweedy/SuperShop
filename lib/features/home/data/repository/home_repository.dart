import 'package:dartz/dartz.dart';
import 'package:supershop/core/error/exception.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/features/home/domain/entities/cart/post_cart_product.dart';
import 'package:supershop/features/home/domain/entities/categories/get_categories.dart';
import 'package:supershop/features/home/domain/entities/categories/get_category_products.dart';
import 'package:supershop/features/home/domain/entities/favorites/get_favorite_products.dart';
import 'package:supershop/features/home/domain/entities/favorites/post_favorite_products.dart';
import 'package:supershop/features/home/domain/entities/home/get_home.dart';
import 'package:supershop/features/home/domain/usecases/get_category_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_product_details_usecase.dart';
import 'package:supershop/features/home/domain/usecases/search_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/add_cart_product_usecase.dart';
import 'package:supershop/features/home/domain/entities/products/search_product.dart';
import 'package:supershop/features/home/domain/entities/products/get_product_details.dart';

import '../datasource/home_remote_data_source.dart';
import '../../domain/repository/home_base_repository.dart';
import '../../domain/usecases/add_or_remove_favorite_product.dart';

class HomeRepository extends HomeBaseRepository {
  HomeBaseRemoteDataSource repository;

  HomeRepository({
    required this.repository,
  });

  @override
  Future<Either<NetworkExceptions, GetHome>> getHomeData() async {
    try {
      final result = await repository.getHomeData();
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, GetCategories>> getCategories() async {
    try {
      final result = await repository.getCategories();
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, PostFavoriteProducts>>
      addOrRemoveFavoriteProduct(
    AddOrRemoveFavoriteProductUseCaseParameters parameters,
  ) async {
    try {
      final result = await repository.addOrRemoveFavoriteProduct(parameters);
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

  @override
  Future<Either<NetworkExceptions, PostCartProduct>> addCartProduct(
      AddCartProductUseCaseParameters parameters) async {
    try {
      final result = await repository.addCartProduct(parameters);
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, GetCategoryProducts>> getCategoryProducts(
      GetCategoryProductsUseCaseParameters parameters) async {
    try {
      final result = await repository.getCategoryProducts(parameters);
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, GetProductDetails>> getProductDetails(
      GetProductDetailsUseCaseParameters parameters) async {
    try {
      final result = await repository.getProductDetails(parameters);
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<SearchProduct>>> searchProducts(
      SearchProductsUseCaseParameters parameters) async {
    try {
      final result = await repository.searchProducts(parameters);
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }
}
