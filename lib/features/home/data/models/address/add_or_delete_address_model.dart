import 'package:supershop/features/home/data/models/address/add_or_delete_address_data_model.dart';
import 'package:supershop/features/home/domain/entities/address/add_or_delete_address.dart';

class AddOrDeleteAddressModel extends AddOrDeleteAddress {
  const AddOrDeleteAddressModel({
    required super.status,
    required super.message,
    required super.addOrDeleteAddressData,
  });

  factory AddOrDeleteAddressModel.fromJson(Map<String, dynamic> json) {
    return AddOrDeleteAddressModel(
      status: json['status'],
      message: json['message'],
      addOrDeleteAddressData:
          AddOrDeleteAddressDataModel.fromJson(json['data']),
    );
  }
}
