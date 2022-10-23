import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/custom_app_bar.dart';
import 'package:supershop/core/components/navigation_component.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/services/service_locator.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/domain/entities/categories/get_category_product_data.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/features/home/presentation/screens/product_details_screen.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String? categoryTitle;

  const CategoryProductsScreen({Key? key, this.categoryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        print('Category Products State $state');
        switch (state.getCategoryProductsState) {
          case RequestState.isLoading:
            return const ShowCircularLoading();

          case RequestState.success:
            var products = state.getCategoryProducts!.data.categoryProducts;
            return Scaffold(
              appBar: const CustomAppBar(),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  color: Colors.grey[300],
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          '$categoryTitle',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 2,
                        childAspectRatio: 0.6,
                        mainAxisSpacing: 2,
                        children: List.generate(
                          products.length,
                          (index) => products.isEmpty
                              ? const Center(
                                  child: Text(
                                    'Coming Soon',
                                    style: TextStyle(fontSize: 50),
                                  ),
                                )
                              : productItemBuilder(
                                  products[index],
                                  context,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          case RequestState.error:
            return ShowError(
              networkExceptions: state.getCategoryProductsErrorMessage!,
            );
        }
      },
    );
  }

  Widget productItemBuilder(GetCategoryProductData model, context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<HomeBloc>(context)
            .add(GetCategoryProductsEvent(model.id));
        navigateTo(context, ProductDetailsScreen());
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsetsDirectional.only(start: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                CachedNetworkImage(
                  imageUrl: model.image,
                  height: 150,
                  width: 150,
                ),
                if (model.discount != 0)
                  Container(
                    color: AppColors.primaryColorLight,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Discount',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
            Text(
              model.name,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'EGP',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '${model.price}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    if (model.discount != 0)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'EGP',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            '${model.oldPrice}',
                            style: const TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey),
                          ),
                          Text(
                            '${model.discount}' '% OFF',
                            style: const TextStyle(
                                color: Colors.red, fontSize: 11),
                          )
                        ],
                      ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
