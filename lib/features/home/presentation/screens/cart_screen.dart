import 'package:buildcondition/buildcondition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/custom_app_bar.dart';
import 'package:supershop/core/components/custom_button.dart';
import 'package:supershop/core/components/my_divider.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/presentation/components/cart_item_component.dart';
import 'package:supershop/features/home/presentation/controllers/cart/cart_bloc.dart';
import 'package:supershop/features/home/presentation/screens/addresses_screen.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class CartScreen extends StatelessWidget {
  final Map<int, bool> favorites;

  final TextEditingController productController = TextEditingController();

  CartScreen({
    Key? key,
    this.favorites = const {},
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        print('Cart Screen state $state');
        switch (state.getCartProductsState) {
          case RequestState.isLoading:
            return const ShowCircularLoading();

          case RequestState.success:
            var products = state.getCartProducts!.getCart.getCartItems;
            var subTotal = state.getCartProducts!.getCart.subTotalPrice;
            var total = state.getCartProducts!.getCart.totalPrice;
            var cartLength = products.length;

            var shippingFee = subTotal * (0.9 / 100);
            var totalPrice = (total + shippingFee);

            return Scaffold(
              appBar: const CustomAppBar(),
              body: BuildCondition(
                condition: cartLength != 0,
                builder: (context) {
                  return Column(
                    children: [
                      if (state.deleteCartProductsState ==
                              RequestState.isLoading ||
                          state.updateCartProductsState ==
                              RequestState.isLoading)
                        const ShowLinearLoading(),
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => CartItemComponent(
                            favorites: favorites,
                            productController: productController,
                            item: products[index],
                          ),
                          separatorBuilder: (context, index) =>
                              const MyDivider(),
                          itemCount: products.length,
                        ),
                      ),
                      Container(
                        color: AppColors.productGridViewColorLight
                            .withOpacity(0.6),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${LocaleKeys.subTotal.tr()} ( $cartLength ${LocaleKeys.items.tr()} )',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const Spacer(),
                                Text(
                                  '${LocaleKeys.currency.tr()} ${NumberFormat.currency(decimalDigits: 2, symbol: "").format(subTotal)}',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                            AppSize.sizedBox15,
                            Row(
                              children: [
                                Text(
                                  LocaleKeys.shippingFee.tr(),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const Spacer(),
                                Text(
                                  '${LocaleKeys.currency.tr()} ${NumberFormat.currency(decimalDigits: 2, symbol: "").format(shippingFee)}',
                                  style: const TextStyle(
                                    color: AppColors.productInfoColorLight,
                                  ),
                                )
                              ],
                            ),
                            AppSize.sizedBox20,
                            Row(
                              textBaseline: TextBaseline.alphabetic,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: [
                                Text(
                                  LocaleKeys.totalPrice.tr(),
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                Text(
                                  LocaleKeys.vat.tr(),
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '${LocaleKeys.currency.tr()} ${NumberFormat.currency(decimalDigits: 2, symbol: "").format(totalPrice)}',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      AppSize.sizedBox15,
                      Padding(
                        padding: AppSize.paddingHorizontal,
                        child: CustomButton(
                          title: LocaleKeys.checkout.tr(),
                          onPressed: () {
                            navigateTo(context, const AddressesScreen());
                          },
                        ),
                      ),
                      AppSize.sizedBox20,
                    ],
                  );
                },
                fallback: (context) => Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 5,
                  ),
                  child: Image.asset(
                    'assets/images/empty_cart.png',
                  ),
                ),
              ),
            );

          case RequestState.error:
            return ShowError(
              networkExceptions: state.getCartProductsErrorMessage!,
            );
        }
      },
    );
  }
}
