import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/services/service_locator.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/app_string.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/general/components.dart';
import 'package:supershop/home/domain/entities/home.model.dart';
import 'package:supershop/home/domain/entities/product.dart';
import 'package:supershop/home/presentation/controller/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => sl<HomeBloc>()..add(const GetHomeDataEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // if (state is AppChangeFavoritesDataSuccessState) {
          //   if (!state.model.status) {
          //     flutterToast(
          //       message: state.model.message,
          //       state: ToastStates.ERROR,
          //     );
          //   }
          // }
        },
        builder: (context, state) {
          return state.when(
            initial: () => showLoading(),
            loading: () => showLoading(),
            success: (homeData) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    AppString.appName,
                  ),
                  titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
                ),
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildCarousalSlider(homeData),
                      AppSize.sizedBox15,
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 8),
                      //   height: 100,
                      //   child: ListView.separated(
                      //     physics: BouncingScrollPhysics(),
                      //     scrollDirection: Axis.horizontal,
                      //     itemBuilder: (context, index) => buildCategoryItem(
                      //       categoryModel.data.data[index],
                      //     ),
                      //     separatorBuilder: (context, index) => SizedBox(
                      //       width: 8,
                      //     ),
                      //     itemCount: categoryModel.data.data.length,
                      //   ),
                      // ),
                      AppSize.sizedBox20,
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'New Products',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 22.0),
                        child: Container(
                          color: Colors.grey,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: homeData.data.products.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 1,
                              childAspectRatio: 1 / 1.7,
                            ),
                            itemBuilder: (context, index) => buildGridProduct(
                              homeData.data.products[index],
                              context,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            error: (networkExceptions) => Center(
              child: Text(NetworkExceptions.getErrorMessage(
                networkExceptions,
              )),
            ),
          );
        },
      ),
    );
  }
}

Widget buildGridProduct(Product product, context) {
  return Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              GestureDetector(
                onTap: () {},
                child: Image(
                  image: NetworkImage(
                    product.image,
                  ),
                  fit: BoxFit.contain,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              if (product.discount != 0)
                Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: const Text(
                    'DISCOUNT',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      color: AppColors.primaryColorLight,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppSize.sizedBox10,
                  if (product.discount != 0)
                    Text(
                      product.oldPrice.toString(),
                      style: const TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  const Spacer(),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      // AppCubit.get(context)
                      //     .changeFavoritesData(productModel.id);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildCarousalSlider(Home model) => CarouselSlider(
      items: model.data.banners
          .map(
            (e) => Image(
              image: NetworkImage(e.image),
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: 200,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );

// Widget buildCategoryItem(DataModel model) => Stack(
//       alignment: AlignmentDirectional.bottomCenter,
//       children: [
//         Image(
//           image: NetworkImage(model.image),
//           height: 100.0,
//           width: 100.0,
//           fit: BoxFit.cover,
//         ),
//         Container(
//           color: Colors.black.withOpacity(
//             .8,
//           ),
//           width: 100.0,
//           child: Text(
//             model.name,
//             textAlign: TextAlign.center,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     );
