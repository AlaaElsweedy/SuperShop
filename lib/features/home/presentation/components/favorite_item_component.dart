import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/domain/entities/favorites/get_favorites.dart';
import 'package:supershop/features/home/presentation/controllers/favorites/favorites_bloc.dart';

class FavoriteItemComponent extends StatelessWidget {
  final GetFavorites data;
  final Map<int, bool> favorites;

  const FavoriteItemComponent({
    super.key,
    required this.data,
    required this.favorites,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 120.0,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                CachedNetworkImage(
                  imageUrl: data.favoriteProducts.image,
                  width: 120.0,
                  height: 120.0,
                ),
                if (data.favoriteProducts.discount != 0)
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: const Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.favoriteProducts.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        data.favoriteProducts.price.toString(),
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: AppColors.primaryColorLight,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      if (data.favoriteProducts.discount != 0)
                        Text(
                          data.favoriteProducts.oldPrice.toString(),
                          style: const TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Spacer(),
                      BlocBuilder<FavoritesBloc, FavoritesState>(
                        builder: (context, state) {
                          return IconButton(
                            onPressed: () {
                              context.read<FavoritesBloc>().add(
                                    ChangeFavoriteStatusEvent(
                                      productId: data.favoriteProducts.id,
                                      products: favorites,
                                    ),
                                  );
                              context.read<FavoritesBloc>().add(
                                    AddOrRemoveFavoriteProductsEvent(
                                      data.favoriteProducts.id,
                                    ),
                                  );
                            },
                            icon: const CircleAvatar(
                              radius: 15.0,
                              backgroundColor:
                                  AppColors.backgroundFavoriteColorLight,
                              child: Icon(
                                Icons.favorite,
                                size: 14.0,
                                color: AppColors.favoriteIconColorLight,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
