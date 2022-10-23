import 'package:equatable/equatable.dart';

class GetProductDetailData extends Equatable {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String name;
  final String image;
  final String description;
  final bool isFavorite;
  final bool inCart;
  final List<String> images;

  const GetProductDetailData({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.name,
    required this.image,
    required this.description,
    required this.isFavorite,
    required this.inCart,
    required this.images,
  });

  @override
  List<Object> get props {
    return [
      id,
      price,
      oldPrice,
      discount,
      name,
      image,
      description,
      isFavorite,
      inCart,
      images,
    ];
  }
}
