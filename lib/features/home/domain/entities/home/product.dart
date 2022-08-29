import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final bool isFavorite;
  final bool isCart;

  const Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.isFavorite,
    required this.isCart,
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
      isFavorite,
      isCart,
    ];
  }
}
