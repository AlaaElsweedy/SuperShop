import 'package:supershop/core/error/exception.dart';
import 'package:supershop/core/helpers/dio_helper.dart';
import 'package:supershop/core/network/api_constance.dart';
import 'package:supershop/core/network/error_message_model.dart';
import 'package:supershop/core/utils/constance.dart';
import 'package:supershop/features/home/data/models/address/add_or_delete_address_model.dart';
import 'package:supershop/features/home/data/models/address/get_address_model.dart';
import 'package:supershop/features/home/data/models/cart/get_cart_products_model.dart';
import 'package:supershop/features/home/data/models/cart/add_cart_products_model.dart';
import 'package:supershop/features/home/data/models/cart/update_or_delete_cart_products_model.dart';
import 'package:supershop/features/home/data/models/categories/get_categories_model.dart';
import 'package:supershop/features/home/data/models/categories/get_category_products_model.dart';
import 'package:supershop/features/home/data/models/favorites/get_favorite_products_model.dart';
import 'package:supershop/features/home/data/models/favorites/post_favorites_model.dart';
import 'package:supershop/features/home/data/models/home/home_model.dart';
import 'package:supershop/features/home/data/models/orders/add_order_model.dart';
import 'package:supershop/features/home/data/models/orders/cancel_order_model.dart';
import 'package:supershop/features/home/data/models/orders/get_orders_model.dart';
import 'package:supershop/features/home/data/models/products/get_product_details_model.dart';
import 'package:supershop/features/home/data/models/products/search_product_model.dart';
import 'package:supershop/features/home/data/models/profile/get_or_update_profile_model.dart';
import 'package:supershop/features/home/domain/usecases/add_address_usecase.dart';
import 'package:supershop/features/home/domain/usecases/add_cart_product_usecase.dart';
import 'package:supershop/features/home/domain/usecases/add_order_usecase.dart';
import 'package:supershop/features/home/domain/usecases/cancel_order_usecase.dart';
import 'package:supershop/features/home/domain/usecases/delete_address_usecase.dart';
import 'package:supershop/features/home/domain/usecases/delete_cart_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_category_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_product_details_usecase.dart';
import 'package:supershop/features/home/domain/usecases/search_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/update_cart_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/update_profile_usecase.dart';

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

  Future<AddCartProductsModel> addCartProduct(
      AddCartProductUseCaseParameters parameters);

  Future<GetCartProductsModel> getCartProducts();

  Future<UpdateOrDeleteCartProductsModel> updateCartProducts(
      UpdateCartProductsUseCaseParameters parameters);

  Future<UpdateOrDeleteCartProductsModel> deleteCartProducts(
      DeleteCartProductsUseCaseParameters parameters);

  Future<GetOrUpdateProfileModel> getProfile();

  Future<GetOrUpdateProfileModel> updateProfile(
      UpdateProfileUseCaseParameters parameters);

  Future<AddOrDeleteAddressModel> addAddress(
      AddAddressUseCaseParameters parameters);

  Future<GetAddressModel> getAddress();

  Future<AddOrDeleteAddressModel> deleteAddress(
      DeleteAddressUseCaseParameters parameters);

  Future<GetOrdersModel> getOrders();

  Future<CancelOrderModel> cancelOrder(CancelOrderUseCaseParameters parameters);

  Future<AddOrderModel> addOrder(AddOrderUseCaseParameters parameters);
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
  Future<AddCartProductsModel> addCartProduct(
      AddCartProductUseCaseParameters parameters) async {
    final response = await DioHelper.postData(
      path: ApiConstance.addCartProductPath,
      data: {
        'product_id': parameters.productId,
      },
      token: token,
    );

    if (response.statusCode == 200) {
      return AddCartProductsModel.fromJson(response.data);
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

  @override
  Future<GetCartProductsModel> getCartProducts() async {
    final response = await DioHelper.getData(
      path: ApiConstance.getCartPath,
      token: token,
    );

    if (response.statusCode == 200) {
      return GetCartProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<UpdateOrDeleteCartProductsModel> updateCartProducts(
      UpdateCartProductsUseCaseParameters parameters) async {
    final response = await DioHelper.updateData(
      path: ApiConstance.updateCartProductsPath(parameters.cartId),
      data: {
        'quantity': parameters.quantity,
      },
      token: token,
    );

    if (response.statusCode == 200) {
      return UpdateOrDeleteCartProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<UpdateOrDeleteCartProductsModel> deleteCartProducts(
      DeleteCartProductsUseCaseParameters parameters) async {
    final response = await DioHelper.deleteData(
      path: ApiConstance.deleteCartProductsPath(parameters.cartId),
      token: token,
    );

    if (response.statusCode == 200) {
      return UpdateOrDeleteCartProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AddOrDeleteAddressModel> addAddress(
      AddAddressUseCaseParameters parameters) async {
    final response = await DioHelper.postData(
      path: ApiConstance.getAddressesPath,
      data: {
        'name': parameters.name,
        'city': parameters.city,
        'region': parameters.region,
        'details': parameters.details,
        'notes': parameters.notes,
        'latitude': 31.4175,
        'longitude': 31.8144,
      },
      token: token,
    );

    if (response.statusCode == 200) {
      return AddOrDeleteAddressModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AddOrderModel> addOrder(AddOrderUseCaseParameters parameters) async {
    final response = await DioHelper.postData(
      path: ApiConstance.addOrderPath,
      data: {
        'address_id': parameters.addressId,
        'payment_method': 1,
        'use_points': false,
      },
      token: token,
    );

    if (response.statusCode == 200) {
      return AddOrderModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GetAddressModel> getAddress() async {
    final response = await DioHelper.getData(
      path: ApiConstance.getAddressesPath,
      token: token,
    );

    if (response.statusCode == 200) {
      return GetAddressModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GetOrdersModel> getOrders() async {
    final response = await DioHelper.getData(
      path: ApiConstance.getOrdersPath,
      token: token,
    );

    if (response.statusCode == 200) {
      return GetOrdersModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GetOrUpdateProfileModel> getProfile() async {
    final response = await DioHelper.getData(
      path: ApiConstance.getProfilePath,
      token: token,
    );

    if (response.statusCode == 200) {
      return GetOrUpdateProfileModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GetOrUpdateProfileModel> updateProfile(
      UpdateProfileUseCaseParameters parameters) async {
    final response = await DioHelper.updateData(
      path: ApiConstance.updateProfilePath,
      data: {
        'name': parameters.name,
        'phone': parameters.phone,
        'email': parameters.email,
        'password': parameters.password,
        'image': parameters.image,
      },
      token: token,
    );

    if (response.statusCode == 200) {
      return GetOrUpdateProfileModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AddOrDeleteAddressModel> deleteAddress(
      DeleteAddressUseCaseParameters parameters) async {
    final response = await DioHelper.deleteData(
      path: ApiConstance.deleteAddressPath(parameters.addressId),
      token: token,
    );

    if (response.statusCode == 200) {
      return AddOrDeleteAddressModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<CancelOrderModel> cancelOrder(
      CancelOrderUseCaseParameters parameters) async {
    final response = await DioHelper.getData(
      path: ApiConstance.cancelOrderPath(parameters.orderId),
      token: token,
    );

    if (response.statusCode == 200) {
      return CancelOrderModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
