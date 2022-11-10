import 'package:equatable/equatable.dart';
import 'package:supershop/features/home/domain/entities/profile/change_password_data.dart';

class ChangePassword extends Equatable {
  final bool status;
  final String message;
  final ChangePasswordData changePasswordData;
  const ChangePassword({
    required this.status,
    required this.message,
    required this.changePasswordData,
  });

  @override
  List<Object> get props => [status, message];
}
