import 'package:supershop/features/home/domain/entities/home/home.model.dart';
import 'package:supershop/features/home/data/models/home/home_data_model.dart';

class HomeModel extends Home {
  const HomeModel({
    required super.status,
    required super.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'],
      data: HomeDataModel.fromJson(json['data']),
    );
  }
}
