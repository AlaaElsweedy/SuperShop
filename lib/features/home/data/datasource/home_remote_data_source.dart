import 'package:supershop/core/error/exception.dart';
import 'package:supershop/core/helpers/dio_helper.dart';
import 'package:supershop/core/network/api_constance.dart';
import 'package:supershop/core/network/error_message_model.dart';
import 'package:supershop/core/utils/constance.dart';
import 'package:supershop/features/home/data/models/cart/post_cart_products_model.dart';
import 'package:supershop/features/home/data/models/categories/get_categories_model.dart';
import 'package:supershop/features/home/data/models/categories/get_category_products_model.dart';
import 'package:supershop/features/home/data/models/favorites/get_favorite_products_model.dart';
import 'package:supershop/features/home/data/models/favorites/post_favorites_model.dart';
import 'package:supershop/features/home/data/models/home/home_model.dart';
import 'package:supershop/features/home/data/models/products/get_product_details_model.dart';
import 'package:supershop/features/home/data/models/products/search_product_model.dart';
import 'package:supershop/features/home/domain/usecases/add_cart_product_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_category_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_product_details_usecase.dart';
import 'package:supershop/features/home/domain/usecases/search_products_usecase.dart';

import '../../domain/usecases/add_or_remove_favorite_product.dart';

abstract class HomeBaseRemoteDataSource {
  Future<HomeModel> getHomeData();
  Future<GetCategoriesModel> getCategories();

  Future<GetCategoryProductsModel> getCategoryProducts(
      GetCategoryProductsUseCaseParameters parameters);

  Future<PostFavoritesModel> addOrRemoveFavoriteProduct(
    AddOrRemoveFavoriteProductUseCaseParameters parameters,
  );

  Future<GetFavoriteProductsModel> getFavoriteProducts();

  Future<GetProductDetailsModel> getProductDetails(
      GetProductDetailsUseCaseParameters parameters);

  Future<List<SearchProductModel>> searchProducts(
      SearchProductsUseCaseParameters parameters);

  Future<PostCartProductsModel> addCartProduct(
      AddCartProductUseCaseParameters parameters);
}

class HomeRemoteDataSource extends HomeBaseRemoteDataSource {
  @override
  Future<HomeModel> getHomeData() async {
    final response = await DioHelper.getData(
      path: ApiConstance.homePath,
      token: token,
    );

    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GetCategoriesModel> getCategories() async {
    final response = await DioHelper.getData(
      path: ApiConstance.categoriesPath,
    );

    if (response.statusCode == 200) {
      return GetCategoriesModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<PostFavoritesModel> addOrRemoveFavoriteProduct(
    AddOrRemoveFavoriteProductUseCaseParameters parameters,
  ) async {
    final response = await DioHelper.postData(
      path: ApiConstance.postFavoritesPath,
      data: {
        'product_id': parameters.productId,
      },
      token: token,
    );

    if (response.statusCode == 200) {
      return PostFavoritesModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GetFavoriteProductsModel> getFavoriteProducts() async {
    final response = await DioHelper.getData(
      path: ApiConstance.getFavoritesPath,
      token: token,
    );

    if (response.statusCode == 200) {
      return GetFavoriteProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<PostCartProductsModel> addCartProduct(
      AddCartProductUseCaseParameters parameters) async {
    final response = await DioHelper.postData(
      path: ApiConstance.postCartPath,
      data: {
        'product_id': parameters.productId,
      },
      token: token,
    );

    if (response.statusCode == 200) {
      return PostCartProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GetProductDetailsModel> getProductDetails(
      GetProductDetailsUseCaseParameters parameters) async {
    final response = await DioHelper.getData(
      path: ApiConstance.productDetailsPath(parameters.id),
      token: token,
    );

    if (response.statusCode == 200) {
      return GetProductDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<SearchProductModel>> searchProducts(
      SearchProductsUseCaseParameters parameters) async {
    final response = await DioHelper.postData(
      path: ApiConstance.searchProductsPath,
      data: {
        'text': parameters.title,
      },
      token: token,
    );

    if (response.statusCode == 200) {
      return List<SearchProductModel>.from(response.data['data']
          .map((product) => SearchProductModel.fromJson(product)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GetCategoryProductsModel> getCategoryProducts(
      GetCategoryProductsUseCaseParameters parameters) async {
    final response = await DioHelper.getData(
      path: ApiConstance.categoryProductsPath(parameters.id),
      token: token,
    );

    if (response.statusCode == 200) {
      return GetCategoryProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
