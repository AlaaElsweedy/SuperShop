import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/domain/entities/home/get_home.dart';
import 'package:supershop/features/home/domain/entities/home/product.dart';
import 'package:supershop/features/home/presentation/controllers/favorites/favorites_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/features/home/presentation/screens/product_details_screen.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class ProductGridViewComponent extends StatelessWidget {
  final GetHome homeDta;

  const ProductGridViewComponent({
    Key? key,
    required this.homeDta,
    required this.favorites,
  }) : super(key: key);

  final Map<int, bool> favorites;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: homeDta.data.products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 1 / 1.8,
      ),
      itemBuilder: (context, index) => GridProductItemComponent(
        product: homeDta.data.products[index],
        favorites: favorites,
      ),
    );
  }
}

class GridProductItemComponent extends StatelessWidget {
  final Product product;
  final Map<int, bool> favorites;

  const GridProductItemComponent({
    Key? key,
    required this.product,
    required this.favorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColorLight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                InkWell(
                  onTap: () {
                    context
                        .read<HomeBloc>()
                        .add(GetProductDetailsEvent(product.id));
                    navigateTo(context, ProductDetailsScreen());
                  },
                  child: CachedNetworkImage(
                    imageUrl: product.image,
                    fit: BoxFit.contain,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                if (product.discount != 0)
                  Container(
                    color: AppColors.discountColorLight,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      LocaleKeys.discount.tr(),
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.normalTextWitheColorLight,
                      ),
                    ),
                  ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${LocaleKeys.currency.tr()} ${product.price}',
                      style: Theme.of(context).textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FavoriteIconButton(favorites: favorites, product: product),
                  ],
                ),
                if (product.discount != 0)
                  Text(
                    '${LocaleKeys.currency.tr()} ${product.oldPrice.toString()}',
                    style: Theme.of(context).textTheme.displaySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({
    Key? key,
    required this.favorites,
    required this.product,
  }) : super(key: key);

  final Map<int, bool> favorites;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        return Card(
          elevation: 1,
          color: favorites[product.id]!
              ? AppColors.backgroundFavoriteColorLight
              : AppColors.backgroundUnFavoriteColorLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              favorites[product.id]! ? Icons.favorite : Icons.favorite_border,
              color: favorites[product.id]!
                  ? AppColors.favoriteIconColorLight
                  : AppColors.unFavoriteIconColorLight,
            ),
            onPressed: () {
              context.read<FavoritesBloc>().add(
                    ChangeFavoriteStatusEvent(
                      productId: product.id,
                      products: favorites,
                    ),
                  );
              context.read<FavoritesBloc>().add(
                    AddOrRemoveFavoriteProductsEvent(
                      product.id,
                    ),
                  );
            },
          ),
        );
      },
    );
  }
}
