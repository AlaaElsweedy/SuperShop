import 'package:dartz/dartz.dart';
import 'package:supershop/core/error/network_exceptions.dart';

import '../../domain/entities/register.dart';
import '../../domain/repository/register_base_repository.dart';
import '../../domain/usecases/user_login_usecase.dart';
import '../../domain/usecases/user_sign_up_usecase.dart';
import '../datasource/register_remote_data_source.dart';

class RegisterRepository extends RegisterBaseRepository {
  RegisterBaeRemoteDataSource repository;

  RegisterRepository({
    required this.repository,
  });

  @override
  Future<Either<NetworkExceptions, Register>> userLogin(
    UserLoginParameters parameters,
  ) async {
    try {
      final result = await repository.userLogin(parameters);
      return Right(result);
    } catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, Register>> userSignUp(
    UserSignUpParameters parameters,
  ) async {
    try {
      final result = await repository.userSignUp(parameters);
      return Right(result);
    } catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }
}
