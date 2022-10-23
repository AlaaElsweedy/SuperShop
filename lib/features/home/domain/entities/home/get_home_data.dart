import 'package:equatable/equatable.dart';
import 'package:supershop/features/home/domain/entities/home/banner.dart';
import 'package:supershop/features/home/domain/entities/home/product.dart';

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
