import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supershop/core/components/custom_app_bar.dart';
import 'package:supershop/core/components/custom_drawer.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/presentation/components/carousal_slider_component.dart';
import 'package:supershop/features/home/presentation/components/home_categories_component.dart';
import 'package:supershop/features/home/presentation/components/product_grid_view_component.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class HomeScreen extends StatelessWidget {
  final Map<int, bool> favorites = {};

  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.getHomeDataState != current.getHomeDataState,
      builder: (context, state) {
        {
          //print('Home screen State $state');
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
                drawer: CustomDrawer(favorites: favorites),
                appBar: const CustomAppBar(),
                // appBar: AppBar(
                //   actions: [
                //     IconButton(
                //       onPressed: () {
                //         navigateTo(
                //           context,
                //           FavoritesScreen(favorites: favorites),
                //         );
                //       },
                //       icon: const Icon(Icons.favorite),
                //     ),
                //   ],
                // ),
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarousalSliderComponent(
                        homeBanner: state.getHomeData!,
                      ),
                      AppSize.sizedBox20(context),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0.w),
                        child: Text(
                          LocaleKeys.categories.tr(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      AppSize.sizedBox10(context),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        height: 100.h,
                        child: HomeCategoriesComponent(
                          categories: state.getCategories!,
                        ),
                      ),
                      AppSize.sizedBox20(context),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0.w),
                        child: Text(
                          LocaleKeys.newProducts.tr(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 22.0.h),
                        child: Container(
                          color: AppColors.productGridViewColorLight,
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
              return ShowError(networkExceptions: state.getHomeErrorMessage!);
          }
        }
      },
    );
  }
}
