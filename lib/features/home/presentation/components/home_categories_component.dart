import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/domain/entities/categories/get_categories.dart';
import 'package:supershop/features/home/domain/entities/categories/get_category_data.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/features/home/presentation/screens/category_products_screen.dart';

class HomeCategoriesComponent extends StatelessWidget {
  final GetCategories categories;

  const HomeCategoriesComponent({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => CategoryItem(
        data: categories.data.products[index],
      ),
      separatorBuilder: (context, index) => AppSize.sizedBoxW10(context),
      itemCount: categories.data.products.length,
    );
  }
}

class CategoryItem extends StatelessWidget {
  final GetCategoryData data;

  const CategoryItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeBloc>().add(GetCategoryProductsEvent(data.id));
        navigateTo(
          context,
          CategoryProductsScreen(categoryTitle: data.name),
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CachedNetworkImage(
            imageUrl: data.image,
            height: 100.0.h,
            width: 100.0.w,
            fit: BoxFit.cover,
          ),
          Container(
            color: AppColors.blackBackgroundColorLight,
            width: 100.0.w,
            child: Text(
              data.name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.backgroundColorLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
