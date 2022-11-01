part of 'orders_bloc.dart';

class OrdersState extends Equatable {
  final AddOrder? addOrder;
  final RequestState? addOrderState;
  final NetworkExceptions? addOrderErrorMessage;
  final GetOrders? getOrders;
  final RequestState getOrdersState;
  final NetworkExceptions? getOrdersErrorMessage;

  const OrdersState({
    this.addOrder,
    this.addOrderState,
    this.addOrderErrorMessage,
    this.getOrders,
    this.getOrdersState = RequestState.isLoading,
    this.getOrdersErrorMessage,
  });

  @override
  List<Object?> get props {
    return [
      addOrder,
      addOrderState,
      addOrderErrorMessage,
      getOrders,
      getOrdersState,
      getOrdersErrorMessage,
    ];
  }

  OrdersState copyWith({
    AddOrder? addOrder,
    RequestState? addOrderState,
    NetworkExceptions? addOrderErrorMessage,
    GetOrders? getOrders,
    RequestState? getOrdersState,
    NetworkExceptions? getOrdersErrorMessage,
  }) {
    return OrdersState(
      addOrder: addOrder ?? this.addOrder,
      addOrderState: addOrderState ?? this.addOrderState,
      addOrderErrorMessage: addOrderErrorMessage ?? this.addOrderErrorMessage,
      getOrders: getOrders ?? this.getOrders,
      getOrdersState: getOrdersState ?? this.getOrdersState,
      getOrdersErrorMessage:
          getOrdersErrorMessage ?? this.getOrdersErrorMessage,
    );
  }
}
