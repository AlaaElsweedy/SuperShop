import '../../../domain/entities/home/banner.dart';

class BannerModel extends Banner {
  const BannerModel({
    required super.id,
    required super.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      image: json['image'],
    );
  }
}
