import 'package:equatable/equatable.dart';

class GetAddressData extends Equatable {
  final String name;
  final String city;
  final String region;
  final String details;
  final String notes;
  final int id;

  const GetAddressData({
    required this.name,
    required this.city,
    required this.region,
    required this.details,
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
