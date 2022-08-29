import 'package:equatable/equatable.dart';
import 'package:supershop/features/home/domain/entities/favorites/post_favorites_data.dart';

class PostFavorite extends Equatable {
  final String status;
  final String message;
  final PostFavoritesData favoritesData;

  const PostFavorite({
    required this.status,
    required this.message,
    required this.favoritesData,
  });

  @override
  List<Object> get props => [status, message, favoritesData];
}
