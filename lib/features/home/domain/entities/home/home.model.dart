import 'package:equatable/equatable.dart';
import 'package:supershop/features/home/domain/entities/home/home_data.dart';

class Home extends Equatable {
  final bool status;
  final HomeData data;

  const Home({
    required this.status,
    required this.data,
  });

  @override
  List<Object> get props => [status, data];
}