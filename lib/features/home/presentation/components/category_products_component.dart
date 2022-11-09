import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/domain/entities/categories/get_category_product_data.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/features/home/presentation/screens/product_details_screen.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class CategoryProductsItemComponent extends StatelessWidget {
  final GetCategoryProductData product;

  const CategoryProductsItemComponent({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeBloc>().add(GetProductDetailsEvent(product.id));
        navigateTo(context, ProductDetailsScreen());
      },
      child: Container(
        color: Theme.of(context).backgroundColor,
        padding: EdgeInsetsDirectional.only(start: 8.w, bottom: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                CachedNetworkImage(
                  imageUrl: product.image,
                  height: 150.h,
                  width: 150.w,
                ),
                if (product.discount != 0)
                  Container(
                    color: AppColors.discountColorLight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        LocaleKeys.discount.tr(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.normalTextWitheColor,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            AppSize.sizedBox10(context),
            Text(
              product.name,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            AppSize.sizedBox28(context),
            Text(
              NumberFormat.currency(decimalDigits: 2).format(product.price),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            if (product.discount != 0)
              Text(
                NumberFormat.currency(decimalDigits: 2)
                    .format(product.oldPrice),
                style: Theme.of(context).textTheme.displaySmall,
              )
          ],
        ),
      ),
    );
  }
}
