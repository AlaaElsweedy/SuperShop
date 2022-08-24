import 'package:dartz/dartz.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/home/domain/entities/home.model.dart';

abstract class HomeBaseRepository {
  Future<Either<NetworkExceptions, Home>> getHomeData();
}
