import 'package:supershop/features/home/domain/entities/address/add_or_delete_address_data.dart';

class AddOrDeleteAddressDataModel extends AddOrDeleteAddressData {
  const AddOrDeleteAddressDataModel({
    required super.name,
    required super.city,
    required super.region,
    required super.details,
    required super.notes,
    required super.id,
  });

  factory AddOrDeleteAddressDataModel.fromJson(Map<String, dynamic> json) {
    return AddOrDeleteAddressDataModel(
      name: json['name'],
      city: json['city'],
      region: json['region'],
      details: json['details'],
      notes: json['notes'],
      id: json['id'],
    );
  }
}
