import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../../domain/entities/orders/get_orders_data.dart';
import '../controllers/orders/orders_bloc.dart';
import '../../../../generated/locale_keys.g.dart';

class OrderItemComponent extends StatelessWidget {
  final GetOrdersData order;

  const OrderItemComponent({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.greyBackgroundColorDark
              : AppColors.greyBackgroundColorLight,
          border: Border.all(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Padding(
          padding: AppSize.paddingAll20,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        LocaleKeys.orderId.tr(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      AppSize.sizedBoxW5(context),
                      Text(
                        order.id.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Text(
                    order.date,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              AppSize.sizedBox10(context),
              Row(
                children: [
                  Text(
                    LocaleKeys.totalPriceOrder.tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    ' ${NumberFormat.currency(
                      decimalDigits: 2,
                      locale: '${context.locale}',
                    ).format(order.totalPrice)}',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              AppSize.sizedBox10(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order.status,
                    style: TextStyle(
                      color: (order.status == "New")
                          ? AppColors.productInfoColorLight
                          : AppColors.deleteColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 20.sp,
                    ),
                  ),
                  if (order.status == "New")
                    CustomButton(
                      title: LocaleKeys.cancel.tr(),
                      onPressed: () {
                        AwesomeDialog(
                          dialogBackgroundColor:
                              Theme.of(context).backgroundColor,
                          context: context,
                          dialogType: DialogType.question,
                          animType: AnimType.scale,
                          title: LocaleKeys.cancelOrder.tr(),
                          titleTextStyle: Theme.of(context).textTheme.bodySmall,
                          btnOkOnPress: () {
                            BlocProvider.of<OrdersBloc>(context)
                                .add(CancelOrderEvent(orderId: order.id));
                          },
                          btnCancelOnPress: () {},
                        ).show();
                      },
                      width: 100.w,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
