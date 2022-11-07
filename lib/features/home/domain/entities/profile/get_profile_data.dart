import 'package:equatable/equatable.dart';

class GetOrUpdateProfileData extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String token;
  const GetOrUpdateProfileData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  
    required this.token,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      phone,
      token,
    ];
  }
}
