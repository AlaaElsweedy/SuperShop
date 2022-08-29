import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/features/home/presentation/components/favorite_item_component.dart';
import 'package:supershop/features/home/presentation/controller/get_favorites/get_favorites_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavoritesBloc, GetFavoritesState>(
      builder: (context, state) {
        print('favorite state $state');
        return state.when(
          loading: () => showLoading(),
          success: (favoriteProducts) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => FavoriteItemComponent(
                data: favoriteProducts.data.favoritesData[index],
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: favoriteProducts.data.favoritesData.length,
            );
          },
          error: (networkExceptions) => showError(networkExceptions),
        );
      },
    );
  }
}
