import 'package:supershop/features/home/domain/entities/products/search_product_data.dart';

class SearchProductDataModel extends SearchProductData {
  const SearchProductDataModel({
    required super.id,
    required super.price,
    required super.image,
    required super.name,
    required super.description,
    required super.isFavorite,
    required super.inCart,
  });

  factory SearchProductDataModel.fromJson(Map<String, dynamic> json) {
    return SearchProductDataModel(
      id: json['id'],
      price: json['price'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      isFavorite: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
