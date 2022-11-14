import 'package:equatable/equatable.dart';
import 'sign_out_data.dart';

class SignOut extends Equatable {
  final bool status;
  final String message;
  final SignOutData signOutData;
  const SignOut({
    required this.status,
    required this.message,
    required this.signOutData,
  });

  @override
  List<Object> get props => [status, message, signOutData];
}
