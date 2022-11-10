import 'package:equatable/equatable.dart';

class SignOutData extends Equatable {
  final int id;
  final String token;
  const SignOutData({
    required this.id,
    required this.token,
  });

  @override
  List<Object> get props => [id, token];
}
