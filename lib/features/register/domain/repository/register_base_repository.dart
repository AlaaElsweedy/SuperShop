import 'package:dartz/dartz.dart';

import '../../../../core/error/network_exceptions.dart';
import '../entities/register.dart';
import '../usecases/user_login_usecase.dart';
import '../usecases/user_sign_up_usecase.dart';

abstract class RegisterBaseRepository {
  Future<Either<NetworkExceptions, Register>> userSignUp(
      UserSignUpParameters parameters);
  Future<Either<NetworkExceptions, Register>> userLogin(
      UserLoginParameters parameters);
}
