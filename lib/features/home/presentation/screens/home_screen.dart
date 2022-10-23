import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/custom_drawer.dart';
import 'package:supershop/core/components/navigation_component.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/features/home/presentation/components/carousal_slider_component.dart';
import 'package:supershop/features/home/presentation/components/categories_component.dart';
import 'package:supershop/features/home/presentation/components/product_grid_view_component.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/features/home/presentation/screens/favorites_screen.dart';
import 'package:supershop/generated/locale_keys.g.dart';

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
          switch (state.getHomeDataState) {
            case RequestState.isLoading:
              return const ShowCircularLoading();

            case RequestState.success:
              for (var element in state.getHomeData!.data.products) {
                favorites.addAll({
                  element.id: element.isFavorite,
                });
              }
              return Scaffold(
                drawer: const CustomDrawer(),
                appBar: AppBar(
                  actions: [
                    IconButton(
                      onPressed: () {
                        navigateTo(
                          context,
                          FavoritesScreen(
                            favorites: favorites,
                          ),
                        );
                      },
                      icon: const Icon(Icons.favorite),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarousalSliderComponent(
                        homeBanner: state.getHomeData!,
                      ),
                      AppSize.sizedBox15,
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          LocaleKeys.categories,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        height: 100,
                        child: CategoriesComponent(
                          categories: state.getCategories!,
                        ),
                      ),
                      AppSize.sizedBox20,
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          LocaleKeys.newProducts,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 22.0),
                        child: Container(
                          color: Colors.grey,
                          child: ProductGridViewComponent(
                            homeDta: state.getHomeData!,
                            favorites: favorites,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );

            case RequestState.error:
              return const Center(
                child: Text('Opps!, Somthing wrong!!'),
              );
            //return showError(state.getHomeErrorMessage!);
          }
        }
      },
    );
  }
}
