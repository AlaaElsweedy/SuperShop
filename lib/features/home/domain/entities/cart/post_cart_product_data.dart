import 'package:equatable/equatable.dart';

class PostCartProductData extends Equatable {
  final String id;
  final dynamic price;
  final dynamic oldPrice;
  final String discount;
  final String image;
  final String name;

  const PostCartProductData({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
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
    ];
  }
}
