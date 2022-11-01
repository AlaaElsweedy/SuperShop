part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object> get props => [];
}

class AddCartProductEvent extends CartEvent {
  final int productId;

  const AddCartProductEvent(this.productId);
}

class GetCartProductsEvent extends CartEvent {}

class UpdateCartProductEvent extends CartEvent {
  final int cartId;
  final int quantity;

  const UpdateCartProductEvent({
    required this.cartId,
    required this.quantity,
  });
}

class DeleteAllProductsEvent extends CartEvent {
  final int cartId;

  const DeleteAllProductsEvent(this.cartId);
}

// class IncrementQuantity extends CartEvent {
//   final Map productsQuantity;
//   final int productID;
//   final int quantity;
//   const IncrementQuantity({
//     required this.productsQuantity,
//     required this.productID,
//     required this.quantity,
//   });
// }

// class DecrementQuantity extends CartEvent {
//   final int productId;
//   final int quantity;
//   const DecrementQuantity({
//     required this.productId,
//     required this.quantity,
//   });
// }
