import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/address/add_or_delete_address_data.dart';

class AddOrDeleteAddress extends Equatable {
  final bool status;
  final String message;
  final AddOrDeleteAddressData addOrDeleteAddressData;
  const AddOrDeleteAddress({
    required this.status,
    required this.message,
    required this.addOrDeleteAddressData,
  });

  @override
  List<Object> get props => [status, message, addOrDeleteAddressData];
}
