import 'package:get_it/get_it.dart';
import 'package:supershop/features/home/data/datasource/home_remote_data_source.dart';
import 'package:supershop/features/home/data/repository/home_repository.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';
import 'package:supershop/features/home/domain/usecases/add_or_remove_favorite_product.dart';
import 'package:supershop/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_category_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_favorite_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_home_data_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_product_details_usecase.dart';
import 'package:supershop/features/home/domain/usecases/search_products_usecase.dart';
import 'package:supershop/features/home/presentation/controllers/favorites/favorites_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/features/register/data/datasource/register_remote_data_source.dart';
import 'package:supershop/features/register/data/repository/register_repository.dart';
import 'package:supershop/features/register/domain/repository/register_base_repository.dart';
import 'package:supershop/features/register/domain/usecases/user_login_usecase.dart';
import 'package:supershop/features/register/domain/usecases/user_sign_up_usecase.dart';
import 'package:supershop/features/register/presentation/controller/login_bloc/login_bloc.dart';
import 'package:supershop/features/register/presentation/controller/register_bloc/register_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    // BLOC
    sl.registerFactory(() => RegisterBloc(sl()));
    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerFactory(() => HomeBloc(sl(), sl(), sl(), sl(), sl()));
    sl.registerFactory(() => FavoritesBloc(sl(), sl()));

// USECASES
    sl.registerLazySingleton(() => UserLoginUseCase(baseRepository: sl()));
    sl.registerLazySingleton(() => UserSignUpUseCase(baseRepository: sl()));

    sl.registerLazySingleton(() => GetHomeDataUseCase(sl()));
    sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
    sl.registerLazySingleton(() => GetCategoryProductsUseCase(sl()));
    sl.registerLazySingleton(() => GetProductDetailsUseCase(sl()));
    sl.registerLazySingleton(() => SearchProductsUseCase(sl()));

    sl.registerLazySingleton(() => GetFavoriteProductsUseCase(sl()));
    sl.registerLazySingleton(() => AddOrRemoveFavoriteProductUseCase(sl()));

// REPOSITORY
    sl.registerLazySingleton<RegisterBaseRepository>(
        () => RegisterRepository(repository: sl()));
    sl.registerLazySingleton<HomeBaseRepository>(
        () => HomeRepository(repository: sl()));

    // DATA SOURCE
    sl.registerLazySingleton<RegisterBaeRemoteDataSource>(
        () => RegisterRemoteDataSource());
    sl.registerLazySingleton<HomeBaseRemoteDataSource>(
        () => HomeRemoteDataSource());
  }
}
