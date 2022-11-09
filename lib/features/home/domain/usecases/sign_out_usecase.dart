import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/signout/sign_out.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';

class SignOutUseCase extends BaseUseCase<SignOut, SignOutUseCaseParameters> {
  final HomeBaseRepository repository;

  SignOutUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, SignOut>> call(
      SignOutUseCaseParameters parameters) async {
    return await repository.singOut(parameters);
  }
}

class SignOutUseCaseParameters extends Equatable {
  final String token;
  const SignOutUseCaseParameters({
    required this.token,
  });

  @override
  List<Object> get props => [token];
}
