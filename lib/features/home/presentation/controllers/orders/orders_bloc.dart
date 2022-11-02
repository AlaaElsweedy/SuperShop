import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/features/home/domain/entities/orders/add_order.dart';
import 'package:supershop/features/home/domain/entities/orders/cancel_orders.dart';
import 'package:supershop/features/home/domain/entities/orders/get_orders.dart';
import 'package:supershop/features/home/domain/usecases/add_order_usecase.dart';
import 'package:supershop/features/home/domain/usecases/cancel_order_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_orders_usecase.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final AddOrderUseCase addOrderUseCase;
  final GetOrdersUseCase getOrdersUseCase;
  final CancelOrderUseCase cancelOrderUseCase;

  OrdersBloc(
    this.addOrderUseCase,
    this.getOrdersUseCase,
    this.cancelOrderUseCase,
  ) : super(const OrdersState()) {
    on<AddOrderEvent>(_addOrder);
    on<GetOrdersEvent>(_getOrders);
    on<CancelOrderEvent>(_cancelOrder);
  }

  FutureOr<void> _addOrder(
      AddOrderEvent event, Emitter<OrdersState> emit) async {
    emit(state.copyWith(addOrderState: RequestState.isLoading));

    final result = await addOrderUseCase(AddOrderUseCaseParameters(
      addressId: event.addressId,
    ));
    result.fold((l) {
      emit(state.copyWith(
        addOrderErrorMessage: l,
        addOrderState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        addOrder: r,
        addOrderState: RequestState.success,
      ));
      add(GetOrdersEvent());
    });
  }

  FutureOr<void> _getOrders(
      GetOrdersEvent event, Emitter<OrdersState> emit) async {
    final result = await getOrdersUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
        getOrdersErrorMessage: l,
        getOrdersState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        getOrders: r,
        getOrdersState: RequestState.success,
      ));
    });
  }

  FutureOr<void> _cancelOrder(
      CancelOrderEvent event, Emitter<OrdersState> emit) async {
    emit(state.copyWith(cancelOrderState: RequestState.isLoading));

    final result = await cancelOrderUseCase(
        CancelOrderUseCaseParameters(orderId: event.orderId));
    result.fold((l) {
      emit(state.copyWith(
        cancelOrderErrorMessage: l,
        cancelOrderState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        cancelOrder: r,
        cancelOrderState: RequestState.success,
      ));
      add(GetOrdersEvent());
    });
  }
}
