import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supershop/core/components/custom_row_text_button.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/domain/entities/cart/get_cart_items.dart';
import 'package:supershop/features/home/presentation/controllers/cart/cart_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/favorites/favorites_bloc.dart';
import 'package:supershop/generated/locale_keys.g.dart';

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
        height: 200.h,
        padding: AppSize.paddingAll20,
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
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
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (item.getCartProduct.discount == 0)
                          AppSize.sizedBox10(context),
                        if (item.getCartProduct.discount != 0) const Spacer(),
                        Text(
                          NumberFormat.currency(decimalDigits: 2)
                              .format(item.getCartProduct.price),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        if (item.getCartProduct.discount != 0)
                          Text(
                            NumberFormat.currency(decimalDigits: 2)
                                .format(item.getCartProduct.oldPrice),
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
                    SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: MaterialButton(
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
                        minWidth: 20.w,
                        //shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.zero,
                        child: Icon(
                          Icons.remove,
                          size: 17.w,
                          color: AppColors.primaryColorLight,
                        ),
                      ),
                    ),
                    Text(
                      '${item.quantity}',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: MaterialButton(
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
                        minWidth: 10.w,
                        //shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.zero,
                        child: Icon(
                          Icons.add,
                          size: 17.w,
                          color: AppColors.productInfoColorLight,
                        ),
                      ),
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
                                text: LocaleKeys.moveToWishlist.tr(),
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
                  iconColor: AppColors.deleteColorLight,
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
