import 'package:supershop/features/home/domain/entities/products/get_product_detail_data.dart';

class GetProductDetailsDataModel extends GetProductDetailData {
  const GetProductDetailsDataModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.name,
    required super.image,
    required super.description,
    required super.isFavorite,
    required super.inCart,
    required super.images,
  });

  factory GetProductDetailsDataModel.fromJson(Map<String, dynamic> json) {
    return GetProductDetailsDataModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      isFavorite: json['in_favorites'],
      inCart: json['in_cart'],
      images: json['images'].cast<String>(),
    );
  }
}
