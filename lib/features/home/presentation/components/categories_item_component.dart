import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/navigation.dart';
import '../../../../core/utils/app_size.dart';
import '../../domain/entities/categories/get_category_data.dart';
import '../controllers/home/home_bloc.dart';
import '../screens/category_products_screen.dart';

class CategoriesItemComponent extends StatelessWidget {
  final GetCategoryData data;

  const CategoriesItemComponent({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSize.paddingAll10,
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
              width: 80.0.w,
              height: 80.0.h,
              fit: BoxFit.cover,
            ),
            AppSize.sizedBoxW10(context),
            Text(
              data.name,
              style: TextStyle(
                fontSize: 20.0.sp,
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
