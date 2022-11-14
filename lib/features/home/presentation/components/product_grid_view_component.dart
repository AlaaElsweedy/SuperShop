import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/navigation.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../../domain/entities/home/get_home.dart';
import '../../domain/entities/home/product.dart';
import '../controllers/favorites/favorites_bloc.dart';
import '../controllers/home/home_bloc.dart';
import '../screens/product_details_screen.dart';
import '../../../../generated/locale_keys.g.dart';

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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1.h,
        crossAxisSpacing: 1.w,
        childAspectRatio: 0.5.h,
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
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: AppSize.paddingHorizontal10,
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
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Container(
                      color: Theme.of(context).backgroundColor,
                      child: CachedNetworkImage(
                        imageUrl: product.image,
                        fit: BoxFit.contain,
                        height: 200.h,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                if (product.discount != 0)
                  Container(
                    color: AppColors.discountColor,
                    padding: AppSize.paddingHorizontal5,
                    child: Text(
                      LocaleKeys.discount.tr(),
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.normalTextWitheColor,
                      ),
                    ),
                  ),
              ],
            ),
            AppSize.sizedBox10(context),
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
                      NumberFormat.currency(
                        decimalDigits: 0,
                        locale: '${context.locale}',
                      ).format(product.price),
                      style: Theme.of(context).textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FavoriteIconButton(favorites: favorites, product: product),
                  ],
                ),
                if (product.discount != 0)
                  Text(
                    NumberFormat.currency(
                      decimalDigits: 0,
                      locale: '${context.locale}',
                    ).format(product.oldPrice),
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
        return SizedBox(
          width: 45.w,
          height: 45.h,
          child: Card(
            elevation: 1,
            color: favorites[product.id]!
                ? AppColors.backgroundFavoriteColorLight
                : AppColors.backgroundUnFavoriteColorLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
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
          ),
        );
      },
    );
  }
}
