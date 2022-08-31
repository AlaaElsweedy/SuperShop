import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/features/home/domain/entities/categories/categories_product_data.dart';
import 'package:supershop/features/home/presentation/controllers/categories_bloc/categories_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        print('categories Screen state $state');
        return state.when(
          loading: () => showLoading(),
          success: (categories) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildCatItem(
                categories.data.products[index],
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: categories.data.products.length,
            );
          },
          error: (networkExceptions) => showError(networkExceptions),
        );
      },
    );
  }

  Widget buildCatItem(CategoriesProductData model) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: model.image,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
            AppSize.sizedBox20,
            Text(
              model.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      );
}
