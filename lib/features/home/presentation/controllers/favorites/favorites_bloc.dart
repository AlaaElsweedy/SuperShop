import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/error/network_exceptions.dart';
import '../../../../../core/usecase/base_use_case.dart';
import '../../../../../core/utils/enums.dart';
import '../../../domain/entities/favorites/get_favorite_products.dart';
import '../../../domain/entities/favorites/post_favorite_products.dart';
import '../../../domain/usecases/add_or_remove_favorite_product.dart';
import '../../../domain/usecases/get_favorite_products_usecase.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoriteProductsUseCase getFavoriteProductsUseCase;
  final AddOrRemoveFavoriteProductUseCase addProductToFavoriteUseCase;

  FavoritesBloc(
    this.getFavoriteProductsUseCase,
    this.addProductToFavoriteUseCase,
  ) : super(const FavoritesState()) {
    on<GetFavoriteProductEvent>(_getFavoriteProducts);
    on<AddOrRemoveFavoriteProductsEvent>(_addOrRemoveProducts);
    on<ChangeFavoriteStatusEvent>(_changeFavoritesStatus);
  }

  FutureOr<void> _getFavoriteProducts(
    FavoritesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    final result = await getFavoriteProductsUseCase(const NoParameters());
    result.fold(
      (l) {
        emit(state.copyWith(
          getFavoriteErrorMessage: l,
          getFavoritesState: RequestState.error,
        ));
      },
      (r) {
        emit(state.copyWith(
          getFavoriteProducts: r,
          getFavoritesState: RequestState.success,
        ));
      },
    );
  }

  FutureOr<void> _addOrRemoveProducts(
    AddOrRemoveFavoriteProductsEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    final result = await addProductToFavoriteUseCase(
      AddOrRemoveFavoriteProductUseCaseParameters(event.productId),
    );
    result.fold(
      (l) {
        emit(state.copyWith(
          addOrRemoveFavoriteErrorMessage: l,
          addOrRemoveFavoritesState: RequestState.error,
        ));
      },
      (r) {
        emit(state.copyWith(
          addOrRemoveFavoriteProducts: r,
          addOrRemoveFavoritesState: RequestState.success,
        ));
      },
    );
    add(GetFavoriteProductEvent());
  }

  FutureOr<void> _changeFavoritesStatus(
    ChangeFavoriteStatusEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    event.products[event.productId] = !event.products[event.productId]!;
    emit(ChangeFavoriteStatus());
  }
}
