import 'package:dartz/dartz.dart';
import 'package:supershop/core/error/exception.dart';

import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/home/data/datasource/home_remote_datas_ource.dart';
import 'package:supershop/home/domain/entities/home.model.dart';
import 'package:supershop/home/domain/repository/home_base_repository.dart';

class HomeRepository extends HomeBaseRepository {
  HomeBaseRemoteDataSource repository;

  HomeRepository({
    required this.repository,
  });

  @override
  Future<Either<NetworkExceptions, Home>> getHomeData() async {
    try {
      final result = await repository.getHomeData();
      return Right(result);
    } on ServerException catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }
}
