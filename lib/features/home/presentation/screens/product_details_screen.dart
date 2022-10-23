import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:supershop/core/components/custom_app_bar.dart';
import 'package:supershop/core/components/my_divider.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  final PageController productImages = PageController();

  ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        print('Product Detail State $state');
        switch (state.getProductDetailsState) {
          case RequestState.isLoading:
            return const ShowCircularLoading();

          case RequestState.success:
            var product = state.getProductDetails!.data;
            return Scaffold(
              appBar: const CustomAppBar(),
              body: Column(
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: AppSize.paddingAll,
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              product.name,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 400,
                            width: double.infinity,
                            child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                PageView.builder(
                                  controller: productImages,
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
                            controller: productImages,
                            count: product.images.length,
                            effect: const ExpandingDotsEffect(
                              dotColor:
                                  AppColors.pageIndicatorInActiveDotColorLight,
                              activeDotColor:
                                  AppColors.pageIndicatorInActiveDotColorLight,
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
                                'EGP '
                                ''
                                '${product.price}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              if (product.discount != 0)
                                Row(
                                  children: [
                                    Text(
                                      'EGP' '${product.oldPrice}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    AppSize.sizedBoxW5,
                                    Text(
                                      '${product.discount}% OFF',
                                      style: const TextStyle(
                                        color: AppColors.discountColorLight,
                                      ),
                                    ),
                                  ],
                                ),
                              AppSize.sizedBox15,
                              const MyDivider(),
                              AppSize.sizedBox15,
                              Row(
                                children: [
                                  const Text(
                                    'FREE delivery by ',
                                    style: TextStyle(
                                      color: AppColors.productInfoColorLight,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(getDateTomorrow()),
                                ],
                              ),
                              AppSize.sizedBox15,
                              Text(
                                'Overview',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              AppSize.sizedBox15,
                              Text(product.description),
                              AppSize.sizedBox20,
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                            width: double.infinity,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    color: AppColors.backgroundColorLight,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.shopping_cart_outlined),
                          AppSize.sizedBoxW10,
                          Text(
                            'Add to Cart',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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

String getDateTomorrow() {
  DateTime dateTime = DateTime.now().add(const Duration(days: 1));
  String date = DateFormat.yMMMd().format(dateTime);
  return date;
}
