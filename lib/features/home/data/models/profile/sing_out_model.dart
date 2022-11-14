import 'sign_out_data_model.dart';
import '../../../domain/entities/profile/sign_out.dart';

class SignOutModel extends SignOut {
  const SignOutModel({
    required super.status,
    required super.message,
    required super.signOutData,
  });

  factory SignOutModel.fromJson(Map<String, dynamic> json) {
    return SignOutModel(
      status: json['status'],
      message: json['message'],
      signOutData: SignOutDataModel.fromJson(json['data']),
    );
  }
}
