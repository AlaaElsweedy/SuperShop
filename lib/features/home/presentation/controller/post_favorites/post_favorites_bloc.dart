import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/features/home/domain/entities/favorites/post_favorites.dart';
import 'package:supershop/features/home/domain/usecases/add_product_to_favorite_usecase.dart';

part 'post_favorites_event.dart';
part 'post_favorites_state.dart';
part 'post_favorites_bloc.freezed.dart';

class PostFavoritesBloc extends Bloc<PostFavoritesEvent, PostFavoritesState> {
  AddProductToFavoriteUseCase addProductToFavoriteUseCase;

  PostFavoritesBloc(this.addProductToFavoriteUseCase)
      : super(const LoadingState()) {
    on<AddToFavoritesEvent>(_addToFavorites);
  }

  FutureOr<void> _addToFavorites(
    PostFavoritesEvent event,
    Emitter<PostFavoritesState> emit,
  ) async {
    final result = await addProductToFavoriteUseCase(
        AddProductToFavoriteUseCaseParameters(event.productId));

    result.fold((l) {
      emit(PostFavoritesState.error(l));
    }, (r) {
      emit(PostFavoritesState.success(r));
    });
  }
}
