part of 'categories_bloc.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.loading() = LoadingState;
  const factory CategoriesState.success(Categories categories) = SuccessState;
  const factory CategoriesState.error(NetworkExceptions networkExceptions) =
      ErrorState;
}
