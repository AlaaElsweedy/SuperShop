import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/network_exceptions.dart';
import '../../domain/entities/address/get_address.dart';
import '../../domain/entities/address/address.dart';
import '../../domain/entities/cart/add_cart_product.dart';
import '../../domain/entities/cart/get_cart_products.dart';
import '../../domain/entities/cart/update_or_delete_cart_products.dart';
import '../../domain/entities/categories/get_categories.dart';
import '../../domain/entities/categories/get_category_products.dart';
import '../../domain/entities/favorites/get_favorite_products.dart';
import '../../domain/entities/favorites/post_favorite_products.dart';
import '../../domain/entities/home/get_home.dart';
import '../../domain/entities/profile/sign_out.dart';
import '../../domain/entities/profile/change_password.dart';
import '../../domain/entities/profile/update_profile.dart';
import '../../domain/usecases/cancel_order_usecase.dart';
import '../../domain/entities/orders/cancel_orders.dart';
import '../../domain/usecases/change_password_usecase.dart';
import '../../domain/usecases/delete_cart_products_usecase.dart';
import '../../domain/usecases/delete_address_usecase.dart';
import '../../domain/usecases/add_order_usecase.dart';
import '../../domain/usecases/add_address_usecase.dart';
import '../../domain/entities/profile/get_profile.dart';
import '../../domain/entities/orders/get_orders.dart';
import '../../domain/entities/orders/add_order.dart';
import '../../domain/usecases/get_category_products_usecase.dart';
import '../../domain/usecases/get_product_details_usecase.dart';
import '../../domain/usecases/search_products_usecase.dart';
import '../../domain/usecases/add_cart_product_usecase.dart';
import '../../domain/entities/products/search_product.dart';
import '../../domain/entities/products/get_product_details.dart';
import '../../domain/usecases/sign_out_usecase.dart';
import '../../domain/usecases/update_address_usecase.dart';
import '../../domain/usecases/update_cart_products_usecase.dart';
import '../../domain/usecases/update_profile_usecase.dart';

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
  Future<Either<NetworkExceptions, SearchProduct>> searchProducts(
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
  Future<Either<NetworkExceptions, Address>> addAddress(
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
  Future<Either<NetworkExceptions, Address>> deleteAddress(
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
  Future<Either<NetworkExceptions, GetProfile>> getProfile() async {
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
  Future<Either<NetworkExceptions, UpdateProfile>> updateProfile(
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

  @override
  Future<Either<NetworkExceptions, Address>> updateAddress(
      UpdateAddressUseCaseParameters parameters) async {
    try {
      final result = await repository.updateAddress(parameters);
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, ChangePassword>> changePassword(
      ChangePasswordUseCaseParameters parameters) async {
    try {
      final result = await repository.changePassword(parameters);
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, SignOut>> singOut(
      SignOutUseCaseParameters parameters) async {
    try {
      final result = await repository.signOut(parameters);
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }
}
