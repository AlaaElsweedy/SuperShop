import 'package:equatable/equatable.dart';
import 'package:supershop/features/home/domain/entities/favorites/post_favorite_product_data.dart';

class PostFavoriteProduct extends Equatable {
  final PostFavoriteProductData favoriteProducts;

  const PostFavoriteProduct({
    required this.favoriteProducts,
  });

  @override
  List<Object> get props => [favoriteProducts];
}
