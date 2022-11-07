import 'package:supershop/features/home/domain/entities/address/address_data.dart';

class AddressDataModel extends AddressData {
  const AddressDataModel({
    required super.name,
    required super.city,
    required super.region,
    required super.details,
    required super.notes,
    required super.id,
  });

  factory AddressDataModel.fromJson(Map<String, dynamic> json) {
    return AddressDataModel(
      name: json['name'],
      city: json['city'],
      region: json['region'],
      details: json['details'],
      notes: json['notes'],
      id: json['id'],
    );
  }
}
