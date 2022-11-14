import '../../../domain/entities/favorites/get_favorite_products.dart';
import 'get_favorite_products_data_model.dart';

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
