import 'package:buildcondition/buildcondition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/presentation/components/no_orders_component.dart';
import 'package:supershop/features/home/presentation/components/order_item_component.dart';
import 'package:supershop/features/home/presentation/controllers/orders/orders_bloc.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        print('OrdersScreen $state');
        switch (state.getOrdersState) {
          case RequestState.isLoading:
            return const ShowCircularLoading();

          case RequestState.success:
            var orders = state.getOrders!.getOrdersInfo.getOrdersData;
            orders.sort((a, b) => a.status.compareTo(b.status));

            return Scaffold(
              appBar: AppBar(
                title: Text(LocaleKeys.orders.tr()),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColorLight,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Text(
                              '${orders.length}',
                              style: const TextStyle(
                                color: AppColors.normalTextWitheColorLight,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        AppSize.sizedBoxW10,
                        Text(
                          LocaleKeys.items.tr(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              body: BuildCondition(
                condition: orders.isNotEmpty,
                builder: (context) => orders.isEmpty
                    ? const ShowCircularLoading()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            if (state.cancelOrderState ==
                                RequestState.isLoading)
                              const ShowLinearLoading(),
                            AppSize.sizedBox10,
                            ListView.separated(
                              itemBuilder: (context, index) =>
                                  OrderItemComponent(
                                order: orders[index],
                              ),
                              separatorBuilder: (context, index) => Container(),
                              itemCount: orders.length,
                              shrinkWrap: true,
                              reverse: true,
                              physics: const NeverScrollableScrollPhysics(),
                            ),
                          ],
                        ),
                      ),
                fallback: (context) => const NoOrdersComponent(),
              ),
            );

          case RequestState.error:
            return ShowError(networkExceptions: state.getOrdersErrorMessage!);
        }
      },
    );
  }
}