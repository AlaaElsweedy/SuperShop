import 'package:supershop/home/data/models/home_data_model.dart';
import 'package:supershop/home/domain/entities/home.model.dart';

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
