import 'package:buildcondition/buildcondition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supershop/core/components/my_divider.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/features/home/presentation/components/favorite_item_component.dart';
import 'package:supershop/features/home/presentation/controllers/favorites/favorites_bloc.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class FavoritesScreen extends StatelessWidget {
  final Map<int, bool> favorites;

  const FavoritesScreen({
    key,
    this.favorites = const {},
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        print('favorite state $state');

        switch (state.getFavoritesState) {
          case RequestState.isLoading:
            return const ShowBarLinearLoading();

          case RequestState.success:
            return Scaffold(
              appBar: AppBar(
                title: Text(LocaleKeys.favorites.tr()),
              ),
              body: BuildCondition(
                condition:
                    state.getFavoriteProducts!.data.favoritesData.isNotEmpty,
                builder: (context) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => FavoriteItemComponent(
                    data: state.getFavoriteProducts!.data.favoritesData[index],
                    favorites: favorites,
                  ),
                  separatorBuilder: (context, index) => const MyDivider(),
                  itemCount:
                      state.getFavoriteProducts!.data.favoritesData.length,
                ),
                fallback: (context) => Center(
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/images/no_data.svg'),
                      Text(
                        LocaleKeys.favoritesEmpty.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
            );

          case RequestState.error:
            return ShowError(
              networkExceptions: state.getFavoriteErrorMessage!,
            );
        }
      },
    );
  }
}
