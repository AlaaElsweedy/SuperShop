import 'package:equatable/equatable.dart';

class ChangePassword extends Equatable {
  final bool status;
  final String message;
  const ChangePassword({
    required this.status,
    required this.message,
  });

  @override
  List<Object> get props => [status, message];
}
