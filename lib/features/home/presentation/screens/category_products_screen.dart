import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/custom_app_bar.dart';
import '../../../../core/components/screen_status.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../../../../generated/locale_keys.g.dart';
import '../components/category_products_component.dart';
import '../controllers/home/home_bloc.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String? categoryTitle;

  const CategoryProductsScreen({Key? key, this.categoryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.getCategoryProductsState != current.getCategoryProductsState,
      builder: (context, state) {
        //print('Category Products State $state');
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
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.greyBackgroundColorDark
                      : AppColors.greyBackgroundColorLight,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Theme.of(context).backgroundColor,
                        padding: AppSize.paddingAll20,
                        child: Text(
                          '$categoryTitle'.toUpperCase(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 1.h,
                        crossAxisSpacing: 2.w,
                        childAspectRatio: 0.5.h,
                        children: List.generate(
                          products.length,
                          (index) => products.isEmpty
                              ? Center(
                                  child: Text(
                                    LocaleKeys.soon.tr(),
                                    style: TextStyle(fontSize: 50.sp),
                                  ),
                                )
                              : CategoryProductsItemComponent(
                                  product: products[index],
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
}
