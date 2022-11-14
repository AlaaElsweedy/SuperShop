import 'package:equatable/equatable.dart';
import 'get_home_data.dart';

class GetHome extends Equatable {
  final bool status;
  final GetHomeData data;

  const GetHome({
    required this.status,
    required this.data,
  });

  @override
  List<Object> get props => [status, data];
}
