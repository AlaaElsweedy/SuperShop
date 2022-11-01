part of 'orders_bloc.dart';

class OrdersEvent extends Equatable {
  const OrdersEvent();
  @override
  List<Object> get props => [];
}

class AddOrderEvent extends OrdersEvent {
  final int addressId;
  const AddOrderEvent({
    required this.addressId,
  });
}

class GetOrdersEvent extends OrdersEvent {}
