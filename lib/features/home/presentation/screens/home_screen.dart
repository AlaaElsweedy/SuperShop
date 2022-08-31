import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/features/home/presentation/components/carousal_slider_component.dart';
import 'package:supershop/features/home/presentation/components/categories_component.dart';
import 'package:supershop/features/home/presentation/components/grid_product_item_component.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/features/home/presentation/screens/favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  final Map<int, bool> favorites = {};

  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        {
          print('Home screen State $state');
          return state.when(
            loading: () => showLoading(),
            success: (homeData) {
              for (var element in homeData.data.products) {
                favorites.addAll({element.id: element.isFavorite});
              }
              return Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                FavoritesScreen(favorites: favorites),
                          ));
                        },
                        icon: const Icon(Icons.favorite))
                  ],
                ),
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarousalSliderComponent(homeBanner: homeData),
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
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        height: 100,
                        child: const CategoriesComponent(),
                      ),
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
                              childAspectRatio: 1 / 1.8,
                            ),
                            itemBuilder: (context, index) =>
                                GridProductItemComponent(
                              product: homeData.data.products[index],
                              favorites: favorites,
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
              child: Text(
                NetworkExceptions.getErrorMessage(networkExceptions),
              ),
            ),
          );
        }
      },
    );
  }
}
