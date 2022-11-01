import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/domain/entities/categories/get_category_product_data.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/features/home/presentation/screens/product_details_screen.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class CategoryProductItemComponent extends StatelessWidget {
  final GetCategoryProductData product;

  const CategoryProductItemComponent({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeBloc>().add(GetCategoryProductsEvent(product.id));
        navigateTo(context, ProductDetailsScreen());
      },
      child: Container(
        color: AppColors.backgroundColorLight,
        padding: const EdgeInsetsDirectional.only(start: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                CachedNetworkImage(
                  imageUrl: product.image,
                  height: 150,
                  width: 150,
                ),
                if (product.discount != 0)
                  Container(
                    color: AppColors.discountColorLight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        LocaleKeys.discount.tr(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.normalTextWitheColorLight,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Text(
              product.name,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${LocaleKeys.currency.tr()} ${product.price}',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    if (product.discount != 0)
                      Text(
                        '${LocaleKeys.currency.tr()} ${product.oldPrice}',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
