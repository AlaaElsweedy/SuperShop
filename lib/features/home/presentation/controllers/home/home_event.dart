part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class GetHomeDataEvent extends HomeEvent {}

class GetCategoriesEvent extends HomeEvent {}

class GetCategoryProductsEvent extends HomeEvent {
  final int id;

  const GetCategoryProductsEvent(this.id);
}

class GetProductDetailsEvent extends HomeEvent {
  final int id;

  const GetProductDetailsEvent(this.id);
}

class SearchProductsEvent extends HomeEvent {
  final String title;

  const SearchProductsEvent(this.title);
}
