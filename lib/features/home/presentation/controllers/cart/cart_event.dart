part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object> get props => [];
}

class AddCartProduct extends CartEvent {
  final int productId;

  const AddCartProduct(this.productId);
}

class GetCartProducts extends CartEvent {}

class UpdateCartProduct extends CartEvent {
  final int cartId;
  final int quantity;

  const UpdateCartProduct({
    required this.cartId,
    required this.quantity,
  });
}

class DeleteAllProducts extends CartEvent {
  final int cartId;

  const DeleteAllProducts(this.cartId);
}
