import '../../../domain/entities/home/get_home.dart';
import 'home_data_model.dart';

class HomeModel extends GetHome {
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
