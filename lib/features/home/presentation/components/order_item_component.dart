import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/custom_button.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/domain/entities/orders/get_orders_data.dart';
import 'package:supershop/features/home/presentation/controllers/orders/orders_bloc.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class OrderItemComponent extends StatelessWidget {
  final GetOrdersData order;

  const OrderItemComponent({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greyBackgroundColorLight,
          border: Border.all(
            color: AppColors.borderColorLight,
          ),
          borderRadius: BorderRadius.circular(25),
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
                      AppSize.sizedBoxW5,
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
              AppSize.sizedBox10,
              Row(
                children: [
                  Text(
                    LocaleKeys.totalPriceOrder.tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    " ${NumberFormat.currency(decimalDigits: 0, symbol: "").format(order.totalPrice)} ${LocaleKeys.currency.tr()}",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              AppSize.sizedBox10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order.status,
                    style: TextStyle(
                      color: (order.status == "New")
                          ? AppColors.productInfoColorLight
                          : AppColors.deleteColorLight,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                  if (order.status == "New")
                    CustomButton(
                      title: LocaleKeys.cancel.tr(),
                      onPressed: () {
                        AwesomeDialog(
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
                      width: 100,
                      height: 30,
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
