import 'package:get_it/get_it.dart';
import 'package:supershop/features/home/data/datasource/home_remote_data_source.dart';
import 'package:supershop/features/home/data/repository/home_repository.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';
import 'package:supershop/features/home/domain/usecases/add_address_usecase.dart';
import 'package:supershop/features/home/domain/usecases/add_cart_product_usecase.dart';
import 'package:supershop/features/home/domain/usecases/add_or_remove_favorite_product.dart';
import 'package:supershop/features/home/domain/usecases/add_order_usecase.dart';
import 'package:supershop/features/home/domain/usecases/cancel_order_usecase.dart';
import 'package:supershop/features/home/domain/usecases/change_password_usecase.dart';
import 'package:supershop/features/home/domain/usecases/delete_address_usecase.dart';
import 'package:supershop/features/home/domain/usecases/delete_cart_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_address_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_cart_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_category_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_favorite_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_home_data_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_orders_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_product_details_usecase.dart';
import 'package:supershop/features/home/domain/usecases/get_profile_usecase.dart';
import 'package:supershop/features/home/domain/usecases/search_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/sign_out_usecase.dart';
import 'package:supershop/features/home/domain/usecases/update_address_usecase.dart';
import 'package:supershop/features/home/domain/usecases/update_cart_products_usecase.dart';
import 'package:supershop/features/home/domain/usecases/update_profile_usecase.dart';
import 'package:supershop/features/home/presentation/controllers/address/address_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/cart/cart_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/favorites/favorites_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/orders/orders_bloc.dart';
import 'package:supershop/features/home/presentation/controllers/profile/profile_bloc.dart';
import 'package:supershop/features/register/data/datasource/register_remote_data_source.dart';
import 'package:supershop/features/register/data/repository/register_repository.dart';
import 'package:supershop/features/register/domain/repository/register_base_repository.dart';
import 'package:supershop/features/register/domain/usecases/user_login_usecase.dart';
import 'package:supershop/features/register/domain/usecases/user_sign_up_usecase.dart';
import 'package:supershop/features/register/presentation/controller/cubit/password_visibility_cubit.dart';
import 'package:supershop/features/register/presentation/controller/login_bloc/login_bloc.dart';
import 'package:supershop/features/register/presentation/controller/register_bloc/register_bloc.dart';
import 'package:supershop/general/cubit/app_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    // CUBIT
    sl.registerFactory(() => AppCubit());

    // BLOC
    sl.registerFactory(() => RegisterBloc(sl()));
    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerFactory(() => PasswordVisibilityBloc());

    sl.registerFactory(() => HomeBloc(sl(), sl(), sl(), sl(), sl()));
    sl.registerFactory(() => FavoritesBloc(sl(), sl()));
    sl.registerFactory(() => CartBloc(sl(), sl(), sl(), sl()));
    sl.registerFactory(() => AddressBloc(sl(), sl(), sl(), sl()));
    sl.registerFactory(() => OrdersBloc(sl(), sl(), sl()));
    sl.registerFactory(() => ProfileBloc(sl(), sl(), sl(), sl()));

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

    sl.registerLazySingleton(() => AddCartProductUseCase(sl()));
    sl.registerLazySingleton(() => GetCartProductsUseCase(sl()));
    sl.registerLazySingleton(() => UpdateCartProductsUseCase(sl()));
    sl.registerLazySingleton(() => DeleteCartProductsUseCase(sl()));

    sl.registerLazySingleton(() => AddAddressUseCase(sl()));
    sl.registerLazySingleton(() => GetAddressUseCase(sl()));
    sl.registerLazySingleton(() => UpdateAddressUseCase(sl()));
    sl.registerLazySingleton(() => DeleteAddressUseCase(sl()));

    sl.registerLazySingleton(() => AddOrderUseCase(sl()));
    sl.registerLazySingleton(() => GetOrdersUseCase(sl()));
    sl.registerLazySingleton(() => CancelOrderUseCase(sl()));

    sl.registerLazySingleton(() => GetProfileUseCase(sl()));
    sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));
    sl.registerLazySingleton(() => SignOutUseCase(sl()));
    sl.registerLazySingleton(() => ChangePasswordUseCase(sl()));

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
