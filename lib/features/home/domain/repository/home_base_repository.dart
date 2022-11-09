import 'package:dartz/dartz.dart';
import 'package:supershop/features/home/domain/entities/address/address.dart';
import 'package:supershop/features/home/domain/entities/address/get_address.dart';
import 'package:supershop/features/home/domain/entities/cart/add_cart_product.dart';
import 'package:supershop/features/home/domain/entities/cart/get_cart_products.dart';
import 'package:supershop/features/home/domain/entities/cart/update_or_delete_cart_products.dart';
import 'package:supershop/features/home/domain/entities/categories/get_categories.dart';
import 'package:supershop/features/home/domain/entities/categories/get_category_products.dart';
import 'package:supershop/features/home/domain/entities/favorites/get_favorite_products.dart';
import 'package:supershop/features/home/domain/entities/favorites/post_favorite_products.dart';
import 'package:supershop/features/home/domain/entities/home/get_home.dart';
import 'package:supershop/features/home/domain/entities/orders/add_order.dart';
import 'package:supershop/features/home/domain/entities/orders/cancel_orders.dart';
import 'package:supershop/features/home/domain/entities/orders/get_orders.dart';
import 'package:supershop/features/home/domain/entities/products/get_product_details.dart';
import 'package:supershop/features/home/domain/entities/products/search_product.dart';
import 'package:supershop/features/home/domain/entities/profile/get_profile.dart';
import 'package:supershop/features/home/domain/entities/profile/update_profile.dart';
import 'package:supershop/features/home/domain/entities/signout/change_password.dart';
import 'package:supershop/features/home/domain/entities/signout/sign_out.dart';
import 'package:supershop/features/home/domain/usecases/add_address_usecase.dart';
import 'package:supershop/features/home/domain/usecases/add_cart_product_usecase.dart';
import 'package:supershop/features/home/domain/usecases/add_or_remove_favorite_product.dart';
import 'package:supershop/features/home/domain/usecases/add_order_usecase.dart';
import 'package:supershop/features/home/domain/usecases/cancel_order_usecase.dart';
import 'package:supershop/features/home/domain/usecases/change_password_usecase.dart';
import 'package:supershop/features/home/domain/usecases/delete_address_usecase.dart';
import 'package:supershop/features/home/domain/usecases/delete_cart_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_category_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_product_details_usecase.dart';
import 'package:supershop/features/home/domain/usecases/search_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/sign_out_usecase.dart';
import 'package:supershop/features/home/domain/usecases/update_address_usecase.dart';
import 'package:supershop/features/home/domain/usecases/update_cart_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/update_profile_usecase.dart';
import '../../../../../core/error/network_exceptions.dart';

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

  Future<Either<NetworkExceptions, List<SearchProduct>>> searchProducts(
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
