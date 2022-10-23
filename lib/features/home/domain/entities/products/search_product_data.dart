import 'package:equatable/equatable.dart';

class SearchProductData extends Equatable {
  final int id;
  final dynamic price;
  final String image;
  final String name;
  final String description;
  final bool isFavorite;
  final bool inCart;

  const SearchProductData({
    required this.id,
    required this.price,
    required this.image,
    required this.name,
    required this.description,
    required this.isFavorite,
    required this.inCart,
  });

  @override
  List<Object> get props {
    return [
      id,
      price,
      image,
      name,
      description,
      isFavorite,
      inCart,
    ];
  }
}
