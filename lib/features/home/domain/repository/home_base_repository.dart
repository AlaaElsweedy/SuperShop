import 'package:dartz/dartz.dart';
import 'package:supershop/features/home/domain/entities/cart/post_cart_product.dart';
import 'package:supershop/features/home/domain/entities/categories/get_categories.dart';
import 'package:supershop/features/home/domain/entities/categories/get_category_products.dart';
import 'package:supershop/features/home/domain/entities/favorites/get_favorite_products.dart';
import 'package:supershop/features/home/domain/entities/favorites/post_favorite_products.dart';
import 'package:supershop/features/home/domain/entities/home/get_home.dart';
import 'package:supershop/features/home/domain/entities/products/get_product_details.dart';
import 'package:supershop/features/home/domain/entities/products/search_product.dart';
import 'package:supershop/features/home/domain/usecases/add_cart_product_usecase.dart';
import 'package:supershop/features/home/domain/usecases/add_or_remove_favorite_product.dart';
import 'package:supershop/features/home/domain/usecases/get_category_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_product_details_usecase.dart';
import 'package:supershop/features/home/domain/usecases/search_products_usecase.dart';
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

  Future<Either<NetworkExceptions, PostCartProduct>> addCartProduct(
      AddCartProductUseCaseParameters parameters);
}
