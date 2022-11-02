import 'package:dartz/dartz.dart';
import 'package:supershop/core/error/exception.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/features/home/domain/entities/address/get_address.dart';
import 'package:supershop/features/home/domain/entities/address/add_or_delete_address.dart';
import 'package:supershop/features/home/domain/entities/cart/add_cart_product.dart';
import 'package:supershop/features/home/domain/entities/cart/get_cart_products.dart';
import 'package:supershop/features/home/domain/entities/cart/update_or_delete_cart_products.dart';
import 'package:supershop/features/home/domain/entities/categories/get_categories.dart';
import 'package:supershop/features/home/domain/entities/categories/get_category_products.dart';
import 'package:supershop/features/home/domain/entities/favorites/get_favorite_products.dart';
import 'package:supershop/features/home/domain/entities/favorites/post_favorite_products.dart';
import 'package:supershop/features/home/domain/entities/home/get_home.dart';
import 'package:supershop/features/home/domain/usecases/cancel_order_usecase.dart';
import 'package:supershop/features/home/domain/entities/orders/cancel_orders.dart';
import 'package:supershop/features/home/domain/usecases/delete_cart_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/delete_address_usecase.dart';
import 'package:supershop/features/home/domain/usecases/add_order_usecase.dart';
import 'package:supershop/features/home/domain/usecases/add_address_usecase.dart';
import 'package:supershop/features/home/domain/entities/profile/get_or_update_profile.dart';
import 'package:supershop/features/home/domain/entities/orders/get_orders.dart';
import 'package:supershop/features/home/domain/entities/orders/add_order.dart';
import 'package:supershop/features/home/domain/usecases/get_category_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_product_details_usecase.dart';
import 'package:supershop/features/home/domain/usecases/search_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/add_cart_product_usecase.dart';
import 'package:supershop/features/home/domain/entities/products/search_product.dart';
import 'package:supershop/features/home/domain/entities/products/get_product_details.dart';
import 'package:supershop/features/home/domain/usecases/update_cart_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/update_profile_usecase.dart';

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
  Future<Either<NetworkExceptions, AddCartProduct>> addCartProduct(
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

  @override
  Future<Either<NetworkExceptions, GetCartProducts>> getCartProducts() async {
    try {
      final result = await repository.getCartProducts();
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, AddOrDeleteAddress>> addAddress(
      AddAddressUseCaseParameters parameters) async {
    try {
      final result = await repository.addAddress(parameters);
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, AddOrder>> addOrder(
      AddOrderUseCaseParameters parameters) async {
    try {
      final result = await repository.addOrder(parameters);
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, AddOrDeleteAddress>> deleteAddress(
      DeleteAddressUseCaseParameters parameters) async {
    try {
      final result = await repository.deleteAddress(parameters);
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, UpdateOrDeleteCartProducts>>
      deleteCartProducts(DeleteCartProductsUseCaseParameters parameters) async {
    try {
      final result = await repository.deleteCartProducts(parameters);
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, GetAddress>> getAddress() async {
    try {
      final result = await repository.getAddress();
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, GetOrders>> getOrders() async {
    try {
      final result = await repository.getOrders();
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, GetOrUpdateProfile>> getProfile() async {
    try {
      final result = await repository.getProfile();
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, UpdateOrDeleteCartProducts>>
      updateCartProducts(UpdateCartProductsUseCaseParameters parameters) async {
    try {
      final result = await repository.updateCartProducts(parameters);
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, GetOrUpdateProfile>> updateProfile(
      UpdateProfileUseCaseParameters parameters) async {
    try {
      final result = await repository.updateProfile(parameters);
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, CancelOrder>> cancelOrder(
      CancelOrderUseCaseParameters parameters) async {
    try {
      final result = await repository.cancelOrder(parameters);
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }
}
