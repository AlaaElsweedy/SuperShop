import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/usecase/base_use_case.dart';
import '../../../core/error/network_exceptions.dart';
import '../entities/register.dart';
import '../repository/register_base_repository.dart';

class UserSignUpUseCase extends BaseUseCase<Register, UserSignUpParameters> {
  RegisterBaseRepository baseRepository;
  UserSignUpUseCase({
    required this.baseRepository,
  });

  @override
  Future<Either<NetworkExceptions, Register>> call(
    UserSignUpParameters parameters,
  ) async {
    return await baseRepository.userSignUp(parameters);
  }
}

class UserSignUpParameters extends Equatable {
  final String name;
  final String phone;
  final String email;
  final String password;

  const UserSignUpParameters({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, phone, email, password];
}
