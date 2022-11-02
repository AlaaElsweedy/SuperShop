import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/features/home/domain/entities/categories/get_category_data.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/features/home/presentation/screens/category_products_screen.dart';

class CategoriesItemComponent extends StatelessWidget {
  final GetCategoryData data;

  const CategoriesItemComponent({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          context.read<HomeBloc>().add(GetCategoryProductsEvent(data.id));
          navigateTo(
            context,
            CategoryProductsScreen(
              categoryTitle: data.name,
            ),
          );
        },
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: data.image,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
            AppSize.sizedBoxW10,
            Text(
              data.name,
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
      ),
    );
  }
}
