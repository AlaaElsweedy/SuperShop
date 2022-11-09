import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/domain/entities/favorites/get_favorite_product.dart';
import 'package:supershop/features/home/presentation/controllers/favorites/favorites_bloc.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class FavoriteItemComponent extends StatelessWidget {
  final GetFavoriteProduct data;
  final Map<int, bool> favorites;

  const FavoriteItemComponent({
    super.key,
    required this.data,
    required this.favorites,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSize.paddingAll20,
      child: SizedBox(
        height: 120.0.h,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                CachedNetworkImage(
                  imageUrl: data.favoriteProducts.image,
                  width: 120.0.w,
                  height: 120.0.h,
                ),
                if (data.favoriteProducts.discount != 0)
                  Container(
                    color: AppColors.discountColorLight,
                    padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                    child: Text(
                      LocaleKeys.discount.tr(),
                      style: TextStyle(
                        fontSize: 8.0.sp,
                        color: AppColors.normalTextWitheColor,
                      ),
                    ),
                  ),
              ],
            ),
            AppSize.sizedBoxW10(context),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.favoriteProducts.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0.sp,
                      height: 1.3.h,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        NumberFormat.currency(decimalDigits: 2)
                            .format(data.favoriteProducts.price),
                        style: TextStyle(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColorLight,
                        ),
                      ),
                      AppSize.sizedBoxW5(context),
                      if (data.favoriteProducts.discount != 0)
                        Text(
                          NumberFormat.currency(decimalDigits: 2)
                              .format(data.favoriteProducts.oldPrice),
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: AppColors.mediumTextColorLight,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Spacer(),
                      FavoriteIconButton(data: data, favorites: favorites),
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

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({
    Key? key,
    required this.data,
    required this.favorites,
  }) : super(key: key);

  final GetFavoriteProduct data;
  final Map<int, bool> favorites;

  @override
  Widget build(BuildContext context) {
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
      icon: CircleAvatar(
        radius: 15.0.r,
        backgroundColor: AppColors.backgroundFavoriteColorLight,
        child: Icon(
          Icons.favorite,
          size: 14.0.w,
          color: AppColors.favoriteIconColorLight,
        ),
      ),
    );
  }
}
