import 'banner_model.dart';
import 'product_model.dart';
import '../../../domain/entities/home/get_home_data.dart';

class HomeDataModel extends GetHomeData {
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
