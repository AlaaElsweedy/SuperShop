import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/favorites/get_favorite_products_data.dart';

class GetFavoriteProducts extends Equatable {
  final bool status;
  final GetFavoriteProductsData data;

  const GetFavoriteProducts({
    required this.status,
    required this.data,
  });

  @override
  List<Object> get props => [status, data];
}
