import 'package:supershop/features/home/domain/entities/address/get_address_data.dart';

class GetAddressDataModel extends GetAddressData {
  const GetAddressDataModel({
    required super.name,
    required super.city,
    required super.region,
    required super.details,
    required super.notes,
    required super.id,
  });

  factory GetAddressDataModel.fromJson(Map<String, dynamic> json) {
    return GetAddressDataModel(
      name: json['name'],
      city: json['city'],
      region: json['region'],
      details: json['details'],
      notes: json['notes'],
      id: json['id'],
    );
  }
}
