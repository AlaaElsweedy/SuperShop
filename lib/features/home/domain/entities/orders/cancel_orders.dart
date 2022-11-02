import 'package:equatable/equatable.dart';

class CancelOrder extends Equatable {
  final bool status;
  final String message;

  const CancelOrder({
    required this.status,
    required this.message,
  });

  @override
  List<Object> get props => [status, message];
}
