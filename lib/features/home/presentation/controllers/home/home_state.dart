part of 'home_bloc.dart';

class HomeState extends Equatable {
  final GetHome? getHomeData;
  final RequestState getHomeDataState;
  final NetworkExceptions? getHomeErrorMessage;
  final GetCategories? getCategories;
  final RequestState getCategoriesState;
  final NetworkExceptions? getCategoriesErrorMessage;
  final GetCategoryProducts? getCategoryProducts;
  final RequestState getCategoryProductsState;
  final NetworkExceptions? getCategoryProductsErrorMessage;
  final GetProductDetails? getProductDetails;
  final RequestState getProductDetailsState;
  final NetworkExceptions? getProductDetailsErrorMessage;
  final List<SearchProduct> searchProducts;
  final RequestState searchProductsState;
  final NetworkExceptions? searchProductsErrorMessage;

  const HomeState({
    this.getHomeData,
    this.getHomeDataState = RequestState.isLoading,
    this.getHomeErrorMessage,
    this.getCategories,
    this.getCategoriesState = RequestState.isLoading,
    this.getCategoriesErrorMessage,
    this.getCategoryProducts,
    this.getCategoryProductsState = RequestState.isLoading,
    this.getCategoryProductsErrorMessage,
    this.getProductDetails,
    this.getProductDetailsState = RequestState.isLoading,
    this.getProductDetailsErrorMessage,
    this.searchProducts = const [],
    this.searchProductsState = RequestState.isLoading,
    this.searchProductsErrorMessage,
  });

  @override
  List<Object?> get props {
    return [
      getHomeData,
      getHomeDataState,
      getHomeErrorMessage,
      getCategories,
      getCategoriesState,
      getCategoriesErrorMessage,
      getCategoryProducts,
      getCategoryProductsState,
      getCategoryProductsErrorMessage,
      getProductDetails,
      getProductDetailsState,
      getProductDetailsErrorMessage,
      searchProducts,
      searchProductsState,
      searchProductsErrorMessage,
    ];
  }

  HomeState copyWith({
    GetHome? getHomeData,
    RequestState? getHomeDataState,
    NetworkExceptions? getHomeErrorMessage,
    GetCategories? getCategories,
    RequestState? getCategoriesState,
    NetworkExceptions? getCategoriesErrorMessage,
    GetCategoryProducts? getCategoryProducts,
    RequestState? getCategoryProductsState,
    NetworkExceptions? getCategoryProductsErrorMessage,
    GetProductDetails? getProductDetails,
    RequestState? getProductDetailsState,
    NetworkExceptions? getProductDetailsErrorMessage,
    List<SearchProduct>? searchProducts,
    RequestState? searchProductsState,
    NetworkExceptions? searchProductsErrorMessage,
  }) {
    return HomeState(
      getHomeData: getHomeData ?? this.getHomeData,
      getHomeDataState: getHomeDataState ?? this.getHomeDataState,
      getHomeErrorMessage: getHomeErrorMessage ?? this.getHomeErrorMessage,
      getCategories: getCategories ?? this.getCategories,
      getCategoriesState: getCategoriesState ?? this.getCategoriesState,
      getCategoriesErrorMessage:
          getCategoriesErrorMessage ?? this.getCategoriesErrorMessage,
      getCategoryProducts: getCategoryProducts ?? this.getCategoryProducts,
      getCategoryProductsState:
          getCategoryProductsState ?? this.getCategoryProductsState,
      getCategoryProductsErrorMessage: getCategoryProductsErrorMessage ??
          this.getCategoryProductsErrorMessage,
      getProductDetails: getProductDetails ?? this.getProductDetails,
      getProductDetailsState:
          getProductDetailsState ?? this.getProductDetailsState,
      getProductDetailsErrorMessage:
          getProductDetailsErrorMessage ?? this.getProductDetailsErrorMessage,
      searchProducts: searchProducts ?? this.searchProducts,
      searchProductsState: searchProductsState ?? this.searchProductsState,
      searchProductsErrorMessage:
          searchProductsErrorMessage ?? this.searchProductsErrorMessage,
    );
  }
}
