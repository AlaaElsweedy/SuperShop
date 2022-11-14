import 'package:equatable/equatable.dart';
import 'post_favorite_product.dart';

class PostFavoriteProducts extends Equatable {
  final bool status;
  final String message;
  final PostFavoriteProduct favoritesData;

  const PostFavoriteProducts({
    required this.status,
    required this.message,
    required this.favoritesData,
  });

  @override
  List<Object> get props => [status, message, favoritesData];
}
