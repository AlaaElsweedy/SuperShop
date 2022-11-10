import 'package:equatable/equatable.dart';

class ChangePasswordData extends Equatable {
  final String email;
  const ChangePasswordData({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}
