import 'package:supershop/features/home/data/models/favorites/get_favorite_products_data_model.dart';
import 'package:supershop/features/home/domain/entities/favorites/get_favorite_products.dart';

class GetFavoriteProductsModel extends GetFavoriteProducts {
  const GetFavoriteProductsModel({
    required super.status,
    required super.data,
  });

  factory GetFavoriteProductsModel.fromJson(Map<String, dynamic> json) {
    return GetFavoriteProductsModel(
      status: json['status'],
      data: GetFavoriteProductsDataModel.fromJson(json['data']),
    );
  }
}
