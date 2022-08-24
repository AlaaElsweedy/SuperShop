import 'package:get_it/get_it.dart';
import 'package:supershop/register/data/datasource/register_remote_data_source.dart';
import 'package:supershop/register/data/repository/register_repository.dart';
import 'package:supershop/register/domain/repository/register_base_repository.dart';
import 'package:supershop/register/domain/usecases/user_login_usecase.dart';
import 'package:supershop/register/domain/usecases/user_sign_up_usecase.dart';
import 'package:supershop/register/presentation/controller/bloc/login_bloc.dart';
import 'package:supershop/register/presentation/controller/bloc/register_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    sl.registerFactory(() => RegisterBloc(sl()));
    sl.registerFactory(() => LoginBloc(sl()));

// USECASES
    sl.registerLazySingleton(() => UserLoginUseCase(baseRepository: sl()));
    sl.registerLazySingleton(() => UserSignUpUseCase(baseRepository: sl()));

// REPOSITORY
    sl.registerLazySingleton<RegisterBaseRepository>(
        () => RegisterRepository(repository: sl()));

    // DATA SOURCE
    sl.registerLazySingleton<RegisterBaeRemoteDataSource>(
        () => RegisterRemoteDataSource());
  }
}
