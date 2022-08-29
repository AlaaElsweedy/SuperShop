import 'package:supershop/core/error/exception.dart';
import 'package:supershop/core/helpers/dio_helper.dart';
import 'package:supershop/core/network/api_constance.dart';
import 'package:supershop/core/network/error_message_model.dart';

import '../../domain/usecases/user_login_usecase.dart';
import '../../domain/usecases/user_sign_up_usecase.dart';
import '../models/register_model.dart';

abstract class RegisterBaeRemoteDataSource {
  Future<RegisterModel> userSignUp(UserSignUpParameters parameters);
  Future<RegisterModel> userLogin(UserLoginParameters parameters);
}

class RegisterRemoteDataSource extends RegisterBaeRemoteDataSource {
  @override
  Future<RegisterModel> userLogin(
    UserLoginParameters parameters,
  ) async {
    final response = await DioHelper.postData(
      path: ApiConstance.loginPath,
      data: {
        'email': parameters.email,
        'password': parameters.password,
      },
    );
    if (response.statusCode == 200) {
      return RegisterModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<RegisterModel> userSignUp(UserSignUpParameters parameters) async {
    final response =
        await DioHelper.postData(path: ApiConstance.signUpPath, data: {
      'email': parameters.email,
      'password': parameters.password,
      'name': parameters.name,
      'phone': parameters.phone,
    });

    if (response.statusCode == 200) {
      return RegisterModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
