import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/signout/change_password_data.dart';

class ChangePassword extends Equatable {
  final bool status;
  final String message;
  final ChangePasswordData signOutData;
  const ChangePassword({
    required this.status,
    required this.message,
    required this.signOutData,
  });

  @override
  List<Object> get props => [status, message];
}
