import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/network_exceptions.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/register.dart';
import '../repository/register_base_repository.dart';

class UserLoginUseCase extends BaseUseCase<Register, UserLoginParameters> {
  RegisterBaseRepository baseRepository;
  UserLoginUseCase({
    required this.baseRepository,
  });

  @override
  Future<Either<NetworkExceptions, Register>> call(
    UserLoginParameters parameters,
  ) async {
    return await baseRepository.userLogin(parameters);
  }
}

class UserLoginParameters extends Equatable {
  final String email;
  final String password;

  const UserLoginParameters({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
