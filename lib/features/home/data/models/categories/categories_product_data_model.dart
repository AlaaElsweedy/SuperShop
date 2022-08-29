import 'package:supershop/features/home/domain/entities/categories/categories_product_data.dart';

class CategoriesProductDataModel extends CategoriesProductData {
  const CategoriesProductDataModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory CategoriesProductDataModel.fromJson(Map<String, dynamic> json) {
    return CategoriesProductDataModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
