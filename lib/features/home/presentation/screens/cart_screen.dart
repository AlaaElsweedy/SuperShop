import 'package:buildcondition/buildcondition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/custom_app_bar.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/components/my_dividers.dart';
import '../../../../core/components/navigation.dart';
import '../../../../core/components/screen_status.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../components/cart_item_component.dart';
import '../controllers/cart/cart_bloc.dart';
import 'checkout_screen.dart';
import '../../../../generated/locale_keys.g.dart';

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
        //print('Cart Screen state $state');
        switch (state.getCartProductsState) {
          case RequestState.isLoading:
            return const ShowCircularLoading();

          case RequestState.success:
            var products = state.getCartProducts!.getCart.getCartItems;
            var subTotal = state.getCartProducts!.getCart.subTotalPrice;
            var total = state.getCartProducts!.getCart.totalPrice;
            var cartLength = products.length;
            var result = 0.0;
            for (var element in state.getCartProducts!.getCart.getCartItems) {
              result += element.quantity * element.getCartProduct.price;
            }

            var shippingFee = result * (0.1);
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
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.greyBackgroundColorDark
                            : AppColors.greyBackgroundColorLight,
                        padding: AppSize.paddingAll10,
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
                                  NumberFormat.currency(
                                    decimalDigits: 2,
                                    locale: '${context.locale}',
                                  ).format(subTotal),
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                            AppSize.sizedBox15(context),
                            Row(
                              children: [
                                Text(
                                  LocaleKeys.shippingFee.tr(),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const Spacer(),
                                Text(
                                  NumberFormat.currency(
                                    decimalDigits: 2,
                                    locale: '${context.locale}',
                                  ).format(shippingFee),
                                  style: const TextStyle(
                                    color: AppColors.productInfoColorLight,
                                  ),
                                )
                              ],
                            ),
                            AppSize.sizedBox20(context),
                            Row(
                              textBaseline: TextBaseline.alphabetic,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: [
                                Text(
                                  LocaleKeys.totalPrice.tr(),
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                AppSize.sizedBoxW5(context),
                                Text(
                                  LocaleKeys.vat.tr(),
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: AppColors.normalTextWitheColor,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  NumberFormat.currency(
                                    decimalDigits: 2,
                                    locale: '${context.locale}',
                                  ).format(totalPrice),
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      AppSize.sizedBox15(context),
                      Padding(
                        padding: AppSize.paddingHorizontal20,
                        child: CustomButton(
                          title: LocaleKeys.addOrder.tr(),
                          onPressed: () {
                            navigateTo(context, const CheckoutScreen());
                          },
                        ),
                      ),
                      AppSize.sizedBox20(context),
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
