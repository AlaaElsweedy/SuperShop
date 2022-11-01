import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:supershop/core/components/custom_app_bar.dart';
import 'package:supershop/core/components/custom_row_button.dart';
import 'package:supershop/core/components/my_divider.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/domain/entities/products/get_product_detail_data.dart';
import 'package:supershop/features/home/presentation/controllers/cart/cart_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class ProductDetailsScreen extends StatelessWidget {
  final PageController productImagesController = PageController();

  ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.getProductDetailsState != current.getProductDetailsState,
      builder: (context, state) {
        print('Product Detail State $state');
        switch (state.getProductDetailsState) {
          case RequestState.isLoading:
            return const ShowCircularLoading();

          case RequestState.success:
            var product = state.getProductDetails!.data;
            return Scaffold(
              appBar: const CustomAppBar(),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: AppSize.paddingAll,
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              product.name,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          AppSize.sizedBox10,
                          SizedBox(
                            height: 400,
                            width: double.infinity,
                            child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                PageView.builder(
                                  controller: productImagesController,
                                  itemBuilder: (context, index) =>
                                      CachedNetworkImage(
                                    imageUrl: product.images[index],
                                  ),
                                  itemCount: product.images.length,
                                ),
                              ],
                            ),
                          ),
                          AppSize.sizedBox10,
                          SmoothPageIndicator(
                            controller: productImagesController,
                            count: product.images.length,
                            effect: const ExpandingDotsEffect(
                              dotColor:
                                  AppColors.pageIndicatorInActiveDotColorLight,
                              activeDotColor:
                                  AppColors.pageIndicatorActiveDotColorLight,
                              expansionFactor: 4,
                              dotHeight: 7,
                              dotWidth: 10,
                              spacing: 10,
                            ),
                          ),
                          AppSize.sizedBox20,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${LocaleKeys.currency.tr()} ${product.price}',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              if (product.discount != 0) AppSize.sizedBox10,
                              if (product.discount != 0)
                                Text(
                                  '${LocaleKeys.currency.tr()} ${product.oldPrice}',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              AppSize.sizedBox15,
                              const MyDivider(),
                              AppSize.sizedBox15,
                              Text(
                                LocaleKeys.offerDetails.tr(),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              AppSize.sizedBox15,
                              Text(product.description),
                              AppSize.sizedBox20,
                            ],
                          ),
                        ],
                      ),
                    ),
                    AddToCartButton(product: product),
                    AppSize.sizedBox10,
                  ],
                ),
              ),
            );

          case RequestState.error:
            return ShowError(
              networkExceptions: state.getProductDetailsErrorMessage!,
            );
        }
      },
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  final GetProductDetailData product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        print('Cart Screen in details $state');
        if (state.addCartProductState == RequestState.isLoading) {
          return const ShowCircularLoading();
        }

        return Padding(
          padding: AppSize.paddingAll,
          child: CartBloc.cartIds.contains(product.id)
              ? Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.productGridViewColorLight,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    LocaleKeys.inCart.tr(),
                  ),
                )
              : CustomRowButton(
                  title: LocaleKeys.addToCart.tr(),
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(AddCartProductEvent(product.id));
                  },
                  icon: Icons.shopping_cart,
                ),
        );
      },
    );
  }
}
