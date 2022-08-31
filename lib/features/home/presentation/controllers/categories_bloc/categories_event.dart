part of 'categories_bloc.dart';

@freezed
class CategoriesEvent with _$CategoriesEvent {
  const factory CategoriesEvent.getCategoriesData() = GetCategoriesDataEvent;
}
