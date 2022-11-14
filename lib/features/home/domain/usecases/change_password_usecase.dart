import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/network_exceptions.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/profile/change_password.dart';
import '../repository/home_base_repository.dart';

class ChangePasswordUseCase
    extends BaseUseCase<ChangePassword, ChangePasswordUseCaseParameters> {
  final HomeBaseRepository repository;

  ChangePasswordUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, ChangePassword>> call(
      ChangePasswordUseCaseParameters parameters) async {
    return await repository.changePassword(parameters);
  }
}

class ChangePasswordUseCaseParameters extends Equatable {
  final String currentPassword;
  final String newPassword;
  const ChangePasswordUseCaseParameters({
    required this.currentPassword,
    required this.newPassword,
  });

  @override
  List<Object> get props => [currentPassword, newPassword];
}
