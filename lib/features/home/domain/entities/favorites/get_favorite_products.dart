import 'package:equatable/equatable.dart';

import 'get_favorites.dart';

class GetFavoriteProducts extends Equatable {
  final bool status;
  final GetFavorites data;

  const GetFavoriteProducts({
    required this.status,
    required this.data,
  });

  @override
  List<Object> get props => [status, data];
}
