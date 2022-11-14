import 'package:equatable/equatable.dart';

import 'address_data.dart';

// This class for add, update and delete
class Address extends Equatable {
  final bool status;
  final String message;
  final AddressData addOrDeleteAddressData;
  const Address({
    required this.status,
    required this.message,
    required this.addOrDeleteAddressData,
  });

  @override
  List<Object> get props => [status, message, addOrDeleteAddressData];
}
