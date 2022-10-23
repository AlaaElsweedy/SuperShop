import 'package:supershop/features/home/domain/entities/categories/get_category_data.dart';

class GetCategoryDataModel extends GetCategoryData {
  const GetCategoryDataModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory GetCategoryDataModel.fromJson(Map<String, dynamic> json) {
    return GetCategoryDataModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
