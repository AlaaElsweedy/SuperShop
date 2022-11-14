import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/custom_row_text_button.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../../domain/entities/cart/get_cart_items.dart';
import '../controllers/cart/cart_bloc.dart';
import '../controllers/favorites/favorites_bloc.dart';
import '../../../../generated/locale_keys.g.dart';

class CartItemComponent extends StatelessWidget {
  final TextEditingController productController;
  final GetCartItems item;
  final Map<int, bool> favorites;

  const CartItemComponent({
    Key? key,
    required this.item,
    required this.productController,
    this.favorites = const {},
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    productController.text = '${item.quantity}';
    return InkWell(
      onTap: () {},
      child: Container(
        height: 220.h,
        padding: AppSize.paddingAll10,
        child: Column(
          children: [
            SizedBox(
              height: 120.h,
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: item.getCartProduct.image,
                    width: 100.w,
                    height: 100.h,
                  ),
                  AppSize.sizedBoxW10(context),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.getCartProduct.name,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                        ),
                        AppSize.sizedBox5(context),
                        Text(
                          NumberFormat.currency(
                            decimalDigits: 2,
                            locale: '${context.locale}',
                          ).format(
                            item.getCartProduct.price,
                          ),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        if (item.getCartProduct.discount != 0)
                          Text(
                            NumberFormat.currency(
                              decimalDigits: 2,
                              locale: '${context.locale}',
                            ).format(item.getCartProduct.oldPrice),
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            AppSize.sizedBox10(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    CounterButton(
                      item: item,
                      icon: Icons.remove,
                      color: AppColors.deleteColor,
                      onPressed: () {
                        int quantity = item.quantity;
                        if (quantity > 1) {
                          quantity--;
                          context.read<CartBloc>().add(
                                UpdateCartProductEvent(
                                  cartId: item.id,
                                  quantity: quantity,
                                ),
                              );
                        }
                      },
                    ),
                    AppSize.sizedBoxW5(context),
                    Text(
                      '${item.quantity}'.padLeft(2, '0'),
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    AppSize.sizedBoxW5(context),
                    CounterButton(
                      item: item,
                      icon: Icons.add,
                      onPressed: () {
                        int quantity = item.quantity;
                        if (quantity <= 7) {
                          quantity++;
                          context.read<CartBloc>().add(
                                UpdateCartProductEvent(
                                  cartId: item.id,
                                  quantity: quantity,
                                ),
                              );
                        }
                      },
                      color: AppColors.productInfoColorLight,
                    ),
                  ],
                ),
                BlocBuilder<FavoritesBloc, FavoritesState>(
                  builder: (context, state) {
                    return !favorites[item.getCartProduct.id]!
                        ? Row(
                            children: [
                              const VerticalDivider(),
                              CustomRowTextButton(
                                text: LocaleKeys.addToWishlist.tr(),
                                icon: Icons.favorite_border,
                                iconColor: Theme.of(context).iconTheme.color!,
                                onPressed: () {
                                  context.read<FavoritesBloc>().add(
                                        ChangeFavoriteStatusEvent(
                                          productId: item.getCartProduct.id,
                                          products: favorites,
                                        ),
                                      );
                                  context.read<FavoritesBloc>().add(
                                        AddOrRemoveFavoriteProductsEvent(
                                          item.getCartProduct.id,
                                        ),
                                      );
                                },
                              ),
                              const VerticalDivider(),
                            ],
                          )
                        : const Spacer();
                  },
                ),
                CustomRowTextButton(
                  text: LocaleKeys.delete.tr(),
                  icon: Icons.delete,
                  iconColor: AppColors.deleteColor,
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(DeleteAllProductsEvent(item.id));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final GetCartItems item;
  final Color color;

  const CounterButton({
    Key? key,
    required this.item,
    required this.icon,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25.w,
      height: 25.h,
      child: MaterialButton(
        color: color,
        onPressed: onPressed,
        minWidth: 20.w,
        // shape: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20.r),
        // ),
        padding: EdgeInsets.zero,
        child: Icon(
          icon,
          size: 17.w,
          color: AppColors.backgroundColorLight,
        ),
      ),
    );
  }
}
