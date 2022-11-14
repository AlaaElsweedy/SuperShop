import 'package:dartz/dartz.dart';

import '../../../../../core/error/network_exceptions.dart';
import '../entities/address/address.dart';
import '../entities/address/get_address.dart';
import '../entities/cart/add_cart_product.dart';
import '../entities/cart/get_cart_products.dart';
import '../entities/cart/update_or_delete_cart_products.dart';
import '../entities/categories/get_categories.dart';
import '../entities/categories/get_category_products.dart';
import '../entities/favorites/get_favorite_products.dart';
import '../entities/favorites/post_favorite_products.dart';
import '../entities/home/get_home.dart';
import '../entities/orders/add_order.dart';
import '../entities/orders/cancel_orders.dart';
import '../entities/orders/get_orders.dart';
import '../entities/products/get_product_details.dart';
import '../entities/products/search_product.dart';
import '../entities/profile/change_password.dart';
import '../entities/profile/get_profile.dart';
import '../entities/profile/sign_out.dart';
import '../entities/profile/update_profile.dart';
import '../usecases/add_address_usecase.dart';
import '../usecases/add_cart_product_usecase.dart';
import '../usecases/add_or_remove_favorite_product.dart';
import '../usecases/add_order_usecase.dart';
import '../usecases/cancel_order_usecase.dart';
import '../usecases/change_password_usecase.dart';
import '../usecases/delete_address_usecase.dart';
import '../usecases/delete_cart_products_usecase.dart';
import '../usecases/get_category_products_usecase.dart';
import '../usecases/get_product_details_usecase.dart';
import '../usecases/search_products_usecase.dart';
import '../usecases/sign_out_usecase.dart';
import '../usecases/update_address_usecase.dart';
import '../usecases/update_cart_products_usecase.dart';
import '../usecases/update_profile_usecase.dart';

abstract class HomeBaseRepository {
  Future<Either<NetworkExceptions, GetHome>> getHomeData();
  Future<Either<NetworkExceptions, GetCategories>> getCategories();

  Future<Either<NetworkExceptions, GetCategoryProducts>> getCategoryProducts(
      GetCategoryProductsUseCaseParameters parameters);

  Future<Either<NetworkExceptions, PostFavoriteProducts>>
      addOrRemoveFavoriteProduct(
    AddOrRemoveFavoriteProductUseCaseParameters parameters,
  );

  Future<Either<NetworkExceptions, GetFavoriteProducts>> getFavoriteProducts();

  Future<Either<NetworkExceptions, GetProductDetails>> getProductDetails(
      GetProductDetailsUseCaseParameters parameters);

  Future<Either<NetworkExceptions, SearchProduct>> searchProducts(
      SearchProductsUseCaseParameters parameters);

  Future<Either<NetworkExceptions, AddCartProduct>> addCartProduct(
      AddCartProductUseCaseParameters parameters);

  Future<Either<NetworkExceptions, GetCartProducts>> getCartProducts();

  Future<Either<NetworkExceptions, UpdateOrDeleteCartProducts>>
      updateCartProducts(UpdateCartProductsUseCaseParameters parameters);

  Future<Either<NetworkExceptions, UpdateOrDeleteCartProducts>>
      deleteCartProducts(DeleteCartProductsUseCaseParameters parameters);

  Future<Either<NetworkExceptions, AddOrder>> addOrder(
      AddOrderUseCaseParameters parameters);

  Future<Either<NetworkExceptions, GetOrders>> getOrders();

  Future<Either<NetworkExceptions, CancelOrder>> cancelOrder(
      CancelOrderUseCaseParameters parameters);

  Future<Either<NetworkExceptions, Address>> addAddress(
      AddAddressUseCaseParameters parameters);

  Future<Either<NetworkExceptions, GetAddress>> getAddress();

  Future<Either<NetworkExceptions, Address>> deleteAddress(
      DeleteAddressUseCaseParameters parameters);

  Future<Either<NetworkExceptions, Address>> updateAddress(
      UpdateAddressUseCaseParameters parameters);

  Future<Either<NetworkExceptions, GetProfile>> getProfile();

  Future<Either<NetworkExceptions, UpdateProfile>> updateProfile(
      UpdateProfileUseCaseParameters parameters);

  Future<Either<NetworkExceptions, SignOut>> singOut(
      SignOutUseCaseParameters parameters);

  Future<Either<NetworkExceptions, ChangePassword>> changePassword(
      ChangePasswordUseCaseParameters parameters);
}
