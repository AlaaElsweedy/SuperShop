import 'package:get_it/get_it.dart';
import 'package:supershop/features/home/data/datasource/home_remote_data_source.dart';
import 'package:supershop/features/home/data/repository/home_repository.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';
import 'package:supershop/features/home/domain/usecases/add_product_to_favorite_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_favorite_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_home_data_usecase.dart';
import 'package:supershop/features/home/presentation/controllers/categories_bloc/categories_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/favorites/favorites_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/features/register/data/datasource/register_remote_data_source.dart';
import 'package:supershop/features/register/data/repository/register_repository.dart';
import 'package:supershop/features/register/domain/repository/register_base_repository.dart';
import 'package:supershop/features/register/domain/usecases/user_login_usecase.dart';
import 'package:supershop/features/register/domain/usecases/user_sign_up_usecase.dart';
import 'package:supershop/features/register/presentation/controller/cubit/password_visibility_cubit.dart';
import 'package:supershop/features/register/presentation/controller/login_bloc/login_bloc.dart';
import 'package:supershop/features/register/presentation/controller/register_bloc/register_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    // BLOC
    sl.registerFactory(() => RegisterBloc(sl()));
    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerFactory(() => HomeBloc(sl()));
    sl.registerFactory(() => CategoriesBloc(sl()));
    sl.registerFactory(() => FavoritesBloc(sl(), sl()));

    //CUBIT
    sl.registerFactory(() => PasswordVisibilityBloc());

// USECASES
    sl.registerLazySingleton(() => UserLoginUseCase(baseRepository: sl()));
    sl.registerLazySingleton(() => UserSignUpUseCase(baseRepository: sl()));
    sl.registerLazySingleton(() => GetHomeDataUseCase(sl()));
    sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
    sl.registerLazySingleton(() => GetFavoriteProductsUseCase(sl()));
    sl.registerLazySingleton(() => AddProductToFavoriteUseCase(sl()));

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
