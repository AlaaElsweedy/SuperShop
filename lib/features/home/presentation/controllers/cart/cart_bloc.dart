import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/features/home/domain/entities/cart/add_cart_product.dart';
import 'package:supershop/features/home/domain/entities/cart/get_cart_products.dart';
import 'package:supershop/features/home/domain/entities/cart/update_or_delete_cart_products.dart';
import 'package:supershop/features/home/domain/usecases/add_cart_product_usecase.dart';
import 'package:supershop/features/home/domain/usecases/delete_cart_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_cart_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/update_cart_products_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddCartProductUseCase addCartProductUseCase;
  final GetCartProductsUseCase getCartProductsUseCase;
  final UpdateCartProductsUseCase updateCartProductsUseCase;
  final DeleteCartProductsUseCase deleteCartProductsUseCase;

  CartBloc(
    this.addCartProductUseCase,
    this.getCartProductsUseCase,
    this.updateCartProductsUseCase,
    this.deleteCartProductsUseCase,
  ) : super(const CartState()) {
    on<AddCartProductEvent>(_addCartProduct);
    on<GetCartProductsEvent>(_getCartProducts);
    on<UpdateCartProductEvent>(_updateCartProducts);
    on<DeleteAllProductsEvent>(_deleteCartProducts);
    //on<IncrementQuantity>(_incrementQuantity);
    //on<DecrementQuantity>(_decrementQuantity);
  }

  static List<int> cartIds = [];

  FutureOr<void> _addCartProduct(
      AddCartProductEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(addCartProductState: RequestState.isLoading));

    final result = await addCartProductUseCase(
        AddCartProductUseCaseParameters(productId: event.productId));
    result.fold((l) {
      emit(state.copyWith(
        addCartProductErrorMessage: l,
        addCartProductState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        addCartProduct: r,
        addCartProductState: RequestState.success,
      ));
    });
    add(GetCartProductsEvent());
  }

  FutureOr<void> _getCartProducts(
      GetCartProductsEvent event, Emitter<CartState> emit) async {
    cartIds = [];
    //emit(state.copyWith(getCartProductsState: RequestState.isLoading));

    final result = await getCartProductsUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
        getCartProductsErrorMessage: l,
        getCartProductsState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        getCartProducts: r,
        getCartProductsState: RequestState.success,
      ));
      for (var element in r.getCart.getCartItems) {
        cartIds.add(element.getCartProduct.id);
      }
    });
  }

  FutureOr<void> _updateCartProducts(
      UpdateCartProductEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(updateCartProductsState: RequestState.isLoading));

    final result = await updateCartProductsUseCase(
      UpdateCartProductsUseCaseParameters(
        cartId: event.cartId,
        quantity: event.quantity,
      ),
    );
    result.fold((l) {
      emit(state.copyWith(
        updateCartProductsErrorMessage: l,
        updateCartProductsState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        updateCartProducts: r,
        updateCartProductsState: RequestState.success,
      ));
      add(GetCartProductsEvent());
    });
  }

  FutureOr<void> _deleteCartProducts(
      DeleteAllProductsEvent event, Emitter<CartState> emit) async {
    cartIds.clear();
    emit(state.copyWith(deleteCartProductsState: RequestState.isLoading));

    final result = await deleteCartProductsUseCase(
      DeleteCartProductsUseCaseParameters(cartId: event.cartId),
    );
    result.fold((l) {
      emit(state.copyWith(
        deleteCartProductsErrorMessage: l,
        deleteCartProductsState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        deleteCartProducts: r,
        deleteCartProductsState: RequestState.success,
      ));
    });
    add(GetCartProductsEvent());
  }

  // FutureOr<void> _incrementQuantity(
  //     IncrementQuantity event, Emitter<CartState> emit) async {
  //   int quantity = event.productsQuantity[event.productID];
  //   if (quantity >= 0) {
  //     quantity++;
  //   } else if (quantity > 1) {
  //     quantity--;
  //   } else if (quantity == 1) {
  //     quantity--;
  //   }
  //   event.productsQuantity[event.productID] = quantity;
  //   emit(UpdateProductQuantity());
  //     }

  // FutureOr<void> _decrementQuantity(
  //     DecrementQuantity event, Emitter<CartState> emit) {
  //   event.quantity--;
  //   emit(UpdateProductQuantity());
  // }
}
