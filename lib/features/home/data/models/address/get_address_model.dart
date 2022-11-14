import 'get_address_info_model.dart';
import '../../../domain/entities/address/get_address.dart';

class GetAddressModel extends GetAddress {
  const GetAddressModel({
    required super.status,
    required super.message,
    required super.getAddressInfo,
  });

  factory GetAddressModel.fromJson(Map<String, dynamic> json) {
    return GetAddressModel(
      status: json['status'],
      message: json['message'],
      getAddressInfo: GetAddressInfoModel.fromJson(json['data']),
    );
  }
}
