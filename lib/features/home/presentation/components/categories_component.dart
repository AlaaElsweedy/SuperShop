import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/features/home/domain/entities/categories/get_categories.dart';
import 'package:supershop/features/home/domain/entities/categories/get_category_data.dart';

class CategoriesComponent extends StatelessWidget {
  final GetCategories categories;

  const CategoriesComponent({
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
      separatorBuilder: (context, index) => AppSize.sizedBoxW10,
      itemCount: categories.data.products.length,
    );
  }
}

class CategoryItem extends StatelessWidget {
  final GetCategoryData data;

  const CategoryItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CachedNetworkImage(
          imageUrl: data.image,
          height: 100.0,
          width: 100.0,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.8),
          width: 100.0,
          child: Text(
            data.name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
