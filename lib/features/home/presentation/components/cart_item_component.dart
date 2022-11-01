import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/custom_row_text_button.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/domain/entities/cart/get_cart_items.dart';
import 'package:supershop/features/home/presentation/controllers/cart/cart_bloc.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class CartItemComponent extends StatelessWidget {
  final TextEditingController productController;
  final GetCartItems item;

  const CartItemComponent({
    Key? key,
    required this.item,
    required this.productController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    productController.text = '${item.quantity}';
    return InkWell(
      onTap: () {},
      child: Container(
        height: 180,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: item.getCartProduct.image,
                    width: 100,
                    height: 100,
                  ),
                  AppSize.sizedBoxW10,
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.getCartProduct.name,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (item.getCartProduct.discount == 0)
                          AppSize.sizedBox10,
                        if (item.getCartProduct.discount != 0) const Spacer(),
                        Text(
                          '${LocaleKeys.currency.tr()} ${item.getCartProduct.price}',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        if (item.getCartProduct.discount != 0)
                          Text(
                            '${LocaleKeys.currency.tr()} ${item.getCartProduct.oldPrice}',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
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
                        minWidth: 20,
                        //shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.zero,
                        child: const Icon(
                          Icons.remove,
                          size: 17,
                          color: AppColors.primaryColorLight,
                        ),
                      ),
                    ),
                    Text(
                      '${item.quantity}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 20,
                      height: 20,
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
                        minWidth: 10,
                        //shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.zero,
                        child: const Icon(
                          Icons.add,
                          size: 17,
                          color: AppColors.productInfoColorLight,
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalDivider(),
                CustomRowTextButton(
                  text: LocaleKeys.moveToWishlist.tr(),
                  textColor: AppColors.mediumTextColorLight,
                  icon: Icons.favorite_border,
                  iconColor: AppColors.mediumTextColorLight,
                  function: () {},
                ),
                const VerticalDivider(),
                CustomRowTextButton(
                  text: LocaleKeys.delete.tr(),
                  textColor: AppColors.normalTextRedColorLight,
                  icon: Icons.delete,
                  iconColor: AppColors.deleteColorLight,
                  function: () {
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

class VerticalDivider extends StatelessWidget {
  const VerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 2,
      color: AppColors.productGridViewColorLight,
    );
  }
}
