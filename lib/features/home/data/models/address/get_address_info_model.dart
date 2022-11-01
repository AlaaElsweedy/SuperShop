import 'package:supershop/features/home/data/models/address/get_address_data_model.dart';
import 'package:supershop/features/home/domain/entities/address/get_address_info.dart';

class GetAddressInfoModel extends GetAddressInfo {
  const GetAddressInfoModel({required super.getAddressData});

  factory GetAddressInfoModel.fromJson(Map<String, dynamic> json) {
    return GetAddressInfoModel(
      getAddressData: List<GetAddressDataModel>.from(
        json['data'].map(
          (address) => GetAddressDataModel.fromJson(address),
        ),
      ),
    );
  }
}
