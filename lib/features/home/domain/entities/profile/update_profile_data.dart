import 'package:equatable/equatable.dart';

class UpdateProfileData extends Equatable {
  final String name;
  final String email;
  final String phone;
  const UpdateProfileData({
    required this.name,
    required this.email,
    required this.phone,
  
  });

  @override
  List<Object> get props {
    return [
      name,
      email,
      phone,
    ];
  }
}
