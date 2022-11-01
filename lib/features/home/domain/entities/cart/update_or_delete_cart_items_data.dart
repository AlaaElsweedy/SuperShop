import 'package:equatable/equatable.dart';

class UpdateOrDeleteCartItemsData extends Equatable {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final int discount;
  final String image;
  const UpdateOrDeleteCartItemsData({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  @override
  List<Object> get props {
    return [
      id,
      price,
      oldPrice,
      discount,
      image,
    ];
  }
}
