import 'package:equatable/equatable.dart';
import 'banner.dart';
import 'product.dart';

class GetHomeData extends Equatable {
  final List<Banner> banners;
  final List<Product> products;

  const GetHomeData({
    required this.banners,
    required this.products,
  });

  @override
  List<Object> get props => [banners, products];
}
