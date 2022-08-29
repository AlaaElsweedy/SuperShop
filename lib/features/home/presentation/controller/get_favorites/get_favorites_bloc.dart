import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/favorites/get_favorite_products.dart';
import 'package:supershop/features/home/domain/usecases/add_product_to_favorite_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_favorite_products_usecase.dart';

part 'get_favorites_event.dart';
part 'get_favorites_state.dart';
part 'get_favorites_bloc.freezed.dart';

class GetFavoritesBloc extends Bloc<GetFavoritesEvent, GetFavoritesState> {
  GetFavoriteProductsUseCase getFavoriteProductsUseCase;

  GetFavoritesBloc(this.getFavoriteProductsUseCase)
      : super(const LoadingState()) {
    on<GetFavoriteProductsEvent>(_getFavorites);
  }

  FutureOr<void> _getFavorites(
    GetFavoritesEvent event,
    Emitter<GetFavoritesState> emit,
  ) async {
    final result = await getFavoriteProductsUseCase(const NoParameters());

    result.fold((l) {
      emit(GetFavoritesState.error(l));
    }, (r) {
      emit(GetFavoritesState.success(r));
    });
  }
}
