part of 'cart_bloc.dart';

class CartState extends Equatable {
  final AddCartProduct? addCartProduct;
  final RequestState? addCartProductState;
  final NetworkExceptions? addCartProductErrorMessage;
  final GetCartProducts? getCartProducts;
  final RequestState getCartProductsState;
  final NetworkExceptions? getCartProductsErrorMessage;
  final UpdateOrDeleteCartProducts? updateCartProducts;
  final RequestState? updateCartProductsState;
  final NetworkExceptions? updateCartProductsErrorMessage;
  final UpdateOrDeleteCartProducts? deleteCartProducts;
  final RequestState? deleteCartProductsState;
  final NetworkExceptions? deleteCartProductsErrorMessage;

  const CartState({
    this.addCartProduct,
    this.addCartProductState,
    this.addCartProductErrorMessage,
    this.getCartProducts,
    this.getCartProductsState = RequestState.isLoading,
    this.getCartProductsErrorMessage,
    this.updateCartProducts,
    this.updateCartProductsState,
    this.updateCartProductsErrorMessage,
    this.deleteCartProducts,
    this.deleteCartProductsState,
    this.deleteCartProductsErrorMessage,
  });

  @override
  List<Object?> get props {
    return [
      addCartProduct,
      addCartProductState,
      addCartProductErrorMessage,
      getCartProducts,
      getCartProductsState,
      getCartProductsErrorMessage,
      updateCartProducts,
      updateCartProductsState,
      updateCartProductsErrorMessage,
      deleteCartProducts,
      deleteCartProductsState,
      deleteCartProductsErrorMessage,
    ];
  }

  CartState copyWith({
    AddCartProduct? addCartProduct,
    RequestState? addCartProductState,
    NetworkExceptions? addCartProductErrorMessage,
    GetCartProducts? getCartProducts,
    RequestState? getCartProductsState,
    NetworkExceptions? getCartProductsErrorMessage,
    UpdateOrDeleteCartProducts? updateCartProducts,
    RequestState? updateCartProductsState,
    NetworkExceptions? updateCartProductsErrorMessage,
    UpdateOrDeleteCartProducts? deleteCartProducts,
    RequestState? deleteCartProductsState,
    NetworkExceptions? deleteCartProductsErrorMessage,
  }) {
    return CartState(
      addCartProduct: addCartProduct ?? this.addCartProduct,
      addCartProductState: addCartProductState ?? this.addCartProductState,
      addCartProductErrorMessage:
          addCartProductErrorMessage ?? this.addCartProductErrorMessage,
      getCartProducts: getCartProducts ?? this.getCartProducts,
      getCartProductsState: getCartProductsState ?? this.getCartProductsState,
      getCartProductsErrorMessage:
          getCartProductsErrorMessage ?? this.getCartProductsErrorMessage,
      updateCartProducts: updateCartProducts ?? this.updateCartProducts,
      updateCartProductsState:
          updateCartProductsState ?? this.updateCartProductsState,
      updateCartProductsErrorMessage:
          updateCartProductsErrorMessage ?? this.updateCartProductsErrorMessage,
      deleteCartProducts: deleteCartProducts ?? this.deleteCartProducts,
      deleteCartProductsState:
          deleteCartProductsState ?? this.deleteCartProductsState,
      deleteCartProductsErrorMessage:
          deleteCartProductsErrorMessage ?? this.deleteCartProductsErrorMessage,
    );
  }
}

class UpdateProductQuantity extends CartState {}
