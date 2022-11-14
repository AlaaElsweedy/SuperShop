import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supershop/core/components/navigation.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/features/home/domain/entities/products/search_product_data.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/features/home/presentation/screens/product_details_screen.dart';

class SearchItemComponent extends StatelessWidget {
  final SearchProductData product;

  const SearchItemComponent({
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
        height: 120.h,
        padding: AppSize.paddingAll10,
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: product.image,
              width: 100.w,
              height: 100.h,
            ),
            AppSize.sizedBoxW10(context),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Text(
                    NumberFormat.currency(
                      decimalDigits: 2,
                      locale: '${context.locale}',
                    ).format(
                      product.price,
                    ),
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
