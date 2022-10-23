part of 'cart_bloc.dart';

class CartState extends Equatable {
  final PostCartProduct? postCartProduct;
  final RequestState postCartProductState;
  final NetworkExceptions? postCartProductErrorMessage;

  const CartState({
    this.postCartProduct,
    this.postCartProductState = RequestState.isLoading,
    this.postCartProductErrorMessage,
  });
  // final PostCartProduct? getCartProduct;
  // final RequestState getCartProductState;
  // final NetworkExceptions? getCartProductErrorMessage;
  // final PostCartProduct? removeCartProduct;
  // final RequestState removeCartProductState;
  // final NetworkExceptions? removeCartProductErrorMessage;
  // final PostCartProduct? updateCartProduct;
  // final RequestState updateCartProductState;
  // final NetworkExceptions? updateCartProductErrorMessage;

  @override
  List<Object?> get props => [
        postCartProduct,
        postCartProductState,
        postCartProductErrorMessage,
      ];

  CartState copyWith({
    PostCartProduct? postCartProduct,
    RequestState? postCartProductState,
    NetworkExceptions? postCartProductErrorMessage,
  }) {
    return CartState(
      postCartProduct: postCartProduct ?? this.postCartProduct,
      postCartProductState: postCartProductState ?? this.postCartProductState,
      postCartProductErrorMessage:
          postCartProductErrorMessage ?? this.postCartProductErrorMessage,
    );
  }
}
