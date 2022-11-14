import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/components/custom_app_bar.dart';
import '../../../../core/components/custom_row_button.dart';
import '../../../../core/components/my_dividers.dart';
import '../../../../core/components/screen_status.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../../domain/entities/products/get_product_detail_data.dart';
import '../controllers/cart/cart_bloc.dart';
import '../controllers/home/home_bloc.dart';
import '../../../../generated/locale_keys.g.dart';

class ProductDetailsScreen extends StatelessWidget {
  final PageController productImagesController = PageController();

  ProductDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //spiltDescription();
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.getProductDetailsState != current.getProductDetailsState,
      builder: (context, state) {
        //print('Product Detail State $state');
        switch (state.getProductDetailsState) {
          case RequestState.isLoading:
            return const ShowCircularLoading();

          case RequestState.success:
            var product = state.getProductDetails!.data;
            var spilt = [];
            List<String> descriptionAfterSpilt =
                product.description.split('\r\n');
            for (String text in descriptionAfterSpilt) {
              if (text.contains(':')) spilt.add(text);
              if (spilt.length == 25) break;
            }

            return Scaffold(
              appBar: const CustomAppBar(),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: AppSize.paddingAll10,
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              product.name,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          AppSize.sizedBox10(context),
                          SizedBox(
                            height: 400.h,
                            width: double.infinity,
                            child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                PageView.builder(
                                  controller: productImagesController,
                                  itemBuilder: (context, index) =>
                                      CachedNetworkImage(
                                    imageUrl: product.images[index],
                                    placeholder: (context, url) => Image.asset(
                                      'assets/images/loading.gif',
                                    ),
                                  ),
                                  itemCount: product.images.length,
                                ),
                              ],
                            ),
                          ),
                          AppSize.sizedBox10(context),
                          SmoothPageIndicator(
                            controller: productImagesController,
                            count: product.images.length,
                            effect: ExpandingDotsEffect(
                              dotColor:
                                  AppColors.pageIndicatorInActiveDotColorLight,
                              activeDotColor:
                                  AppColors.pageIndicatorActiveDotColorLight,
                              expansionFactor: 4.w,
                              dotHeight: 7.h,
                              dotWidth: 7.w,
                              spacing: 10.w,
                            ),
                          ),
                          AppSize.sizedBox20(context),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                NumberFormat.currency(
                                  decimalDigits: 2,
                                  locale: '${context.locale}',
                                ).format(product.price),
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              if (product.discount != 0)
                                AppSize.sizedBox10(context),
                              if (product.discount != 0)
                                Text(
                                  NumberFormat.currency(
                                    decimalDigits: 2,
                                    locale: '${context.locale}',
                                  ).format(product.oldPrice),
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              AppSize.sizedBox15(context),
                              const MyDivider(),
                              AppSize.sizedBox15(context),
                              Text(
                                LocaleKeys.offerDetails.tr(),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              AppSize.sizedBox15(context),
                              spilt.length > 3
                                  ? ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          Text(spilt[index]),
                                      itemCount: spilt.length,
                                    )
                                  : Text(product.description),
                              AppSize.sizedBox20(context),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AddToCartButton(product: product),
                    AppSize.sizedBox10(context),
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
        //print('Cart Screen in details $state');
        if (state.addCartProductState == RequestState.isLoading) {
          return const ShowCircularLoading();
        }

        return Padding(
          padding: AppSize.paddingAll10,
          child: CartBloc.cartIds.contains(product.id)
              ? Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.productGridViewColorLight,
                    borderRadius: BorderRadius.circular(5.0.r),
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
