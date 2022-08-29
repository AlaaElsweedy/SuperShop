import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/features/home/domain/entities/categories/categories_product_data.dart';
import 'package:supershop/features/home/presentation/controller/categories_bloc/categories_bloc.dart';

class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        print('categories State $state');
        return state.when(
          loading: () => showLoading(),
          success: (categories) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CategoryItem(
                data: categories.data.products[index],
              ),
              separatorBuilder: (context, index) => AppSize.sizedBoxW10,
              itemCount: categories.data.products.length,
            );
          },
          error: (networkExceptions) => showError(networkExceptions),
        );
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  final CategoriesProductData data;

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
          color: Colors.black.withOpacity(
            .8,
          ),
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
