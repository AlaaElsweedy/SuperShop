import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/address/get_address_info.dart';

class GetAddress extends Equatable {
  final bool status;
  final String? message;
  final GetAddressInfo getAddressInfo;
  const GetAddress({
    required this.status,
    required this.message,
    required this.getAddressInfo,
  });

  @override
  List<Object?> get props => [status, message, getAddressInfo];
}
