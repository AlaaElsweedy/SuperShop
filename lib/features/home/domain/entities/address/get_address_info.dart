import 'package:equatable/equatable.dart';

import 'get_address_data.dart';

class GetAddressInfo extends Equatable {
  final List<GetAddressData> getAddressData;
  const GetAddressInfo({
    required this.getAddressData,
  });

  @override
  List<Object> get props => [getAddressData];
}
