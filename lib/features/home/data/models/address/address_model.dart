import 'address_data_model.dart';
import '../../../domain/entities/address/address.dart';

class AddressModel extends Address {
  const AddressModel({
    required super.status,
    required super.message,
    required super.addOrDeleteAddressData,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      status: json['status'],
      message: json['message'],
      addOrDeleteAddressData: AddressDataModel.fromJson(json['data']),
    );
  }
}
