import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/network_exceptions.dart';
import '../../../../../core/usecase/base_use_case.dart';
import '../../../../../core/utils/enums.dart';
import '../../../domain/entities/categories/get_categories.dart';
import '../../../domain/entities/categories/get_category_products.dart';
import '../../../domain/entities/home/get_home.dart';
import '../../../domain/entities/products/get_product_details.dart';
import '../../../domain/entities/products/search_product.dart';
import '../../../domain/usecases/get_categories_usecase.dart';
import '../../../domain/usecases/get_category_products_usecase.dart';
import '../../../domain/usecases/get_home_data_usecase.dart';
import '../../../domain/usecases/get_product_details_usecase.dart';
import '../../../domain/usecases/search_products_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetCategoryProductsUseCase getCategoryProductsUseCase;
  final GetProductDetailsUseCase getProductDetailsUseCase;
  final SearchProductsUseCase searchProductsUseCase;

  HomeBloc(
    this.getHomeDataUseCase,
    this.getCategoriesUseCase,
    this.getCategoryProductsUseCase,
    this.getProductDetailsUseCase,
    this.searchProductsUseCase,
  ) : super(const HomeState()) {
    on<GetHomeDataEvent>(_getHomeData);
    on<GetCategoriesEvent>(_getCategories);
    on<GetCategoryProductsEvent>(_getCategoryProducts);
    on<GetProductDetailsEvent>(_getProductDetails);
    on<SearchProductsEvent>(_searchProducts);
  }

  FutureOr<void> _getHomeData(
    GetHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await getHomeDataUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
        getHomeErrorMessage: l,
        getHomeDataState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        getHomeData: r,
        getHomeDataState: RequestState.success,
      ));
    });
  }

  FutureOr<void> _getCategories(
    GetCategoriesEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await getCategoriesUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
        getCategoriesErrorMessage: l,
        getCategoriesState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        getCategories: r,
        getCategoriesState: RequestState.success,
      ));
    });
  }

  FutureOr<void> _getCategoryProducts(
      GetCategoryProductsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getCategoryProductsState: RequestState.isLoading));

    final result = await getCategoryProductsUseCase(
        GetCategoryProductsUseCaseParameters(id: event.id));
    result.fold((l) {
      emit(state.copyWith(
        getCategoryProductsErrorMessage: l,
        getCategoryProductsState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        getCategoryProducts: r,
        getCategoryProductsState: RequestState.success,
      ));
    });
  }

  FutureOr<void> _getProductDetails(
      GetProductDetailsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getProductDetailsState: RequestState.isLoading));

    final result = await getProductDetailsUseCase(
        GetProductDetailsUseCaseParameters(id: event.id));
    result.fold((l) {
      emit(state.copyWith(
        getProductDetailsErrorMessage: l,
        getProductDetailsState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        getProductDetails: r,
        getProductDetailsState: RequestState.success,
      ));
    });
  }

  FutureOr<void> _searchProducts(
      SearchProductsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(searchProductsState: RequestState.isLoading));

    final result = await searchProductsUseCase(
        SearchProductsUseCaseParameters(title: event.title));
    result.fold((l) {
      emit(state.copyWith(
        searchProductsErrorMessage: l,
        searchProductsState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        searchProducts: r,
        searchProductsState: RequestState.success,
      ));
    });
  }
}
