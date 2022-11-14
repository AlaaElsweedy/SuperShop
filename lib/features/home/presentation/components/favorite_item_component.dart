import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../../domain/entities/favorites/get_favorite_product.dart';
import '../controllers/favorites/favorites_bloc.dart';
import '../../../../generated/locale_keys.g.dart';

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
                    color: AppColors.discountColor,
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
                  AppSize.sizedBox15(context),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            NumberFormat.currency(
                              decimalDigits: 2,
                              locale: '${context.locale}',
                            ).format(data.favoriteProducts.price),
                            style: TextStyle(
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).brightness == ThemeMode.dark
                                      ? AppColors.primaryColorDark
                                      : AppColors.primaryColorLight,
                            ),
                          ),
                          if (data.favoriteProducts.discount != 0)
                            AppSize.sizedBox5(context),
                          if (data.favoriteProducts.discount != 0)
                            Text(
                              NumberFormat.currency(
                                decimalDigits: 2,
                                locale: '${context.locale}',
                              ).format(data.favoriteProducts.oldPrice),
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? AppColors.mediumTextColorDark
                                    : AppColors.mediumTextColorLight,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                        ],
                      ),
                      AppSize.sizedBoxW5(context),
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
