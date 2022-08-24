import 'package:supershop/core/error/exception.dart';
import 'package:supershop/core/helpers/dio_helper.dart';
import 'package:supershop/core/network/api_constance.dart';
import 'package:supershop/core/network/error_message_model.dart';
import 'package:supershop/home/data/models/home_model.dart';

abstract class HomeBaseRemoteDataSource {
  Future<HomeModel> getHomeData();
}

class HomeRemoteDataSource extends HomeBaseRemoteDataSource {
  @override
  Future<HomeModel> getHomeData() async {
    final response = await DioHelper.getData(
      path: ApiConstance.homePath,
    );

    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
