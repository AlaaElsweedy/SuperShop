import 'package:supershop/features/home/data/models/home/banner_model.dart';
import 'package:supershop/features/home/data/models/home/product_model.dart';
import 'package:supershop/features/home/domain/entities/home/home_data.dart';

class HomeDataModel extends HomeData {
  const HomeDataModel({
    required super.banners,
    required super.products,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDataModel(
      banners: List<BannerModel>.from(
        (json['banners'] as List).map(
          (banner) => BannerModel.fromJson(banner),
        ),
      ),
      products: List<ProductModel>.from(
        (json['products'] as List).map(
          (product) => ProductModel.fromJson(product),
        ),
      ),
    );
  }
}
