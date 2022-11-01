import 'package:equatable/equatable.dart';

class GetCartProductsData extends Equatable {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  const GetCartProductsData({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  @override
  List<Object> get props {
    return [
      id,
      price,
      oldPrice,
      discount,
      image,
      name,
      description,
      images,
      inFavorites,
      inCart,
    ];
  }
}
