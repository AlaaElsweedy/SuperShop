import 'package:equatable/equatable.dart';

class AddOrDeleteAddressData extends Equatable {
  final String name;
  final String city;
  final String region;
  final String details;
  final double latitude;
  final double longitude;
  final String notes;
  final int id;

  const AddOrDeleteAddressData({
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    this.latitude = 31.4175,
    this.longitude = 31.8144,
    required this.notes,
    required this.id,
  });

  @override
  List<Object> get props {
    return [
      name,
      city,
      region,
      details,
      notes,
      id,
    ];
  }
}
