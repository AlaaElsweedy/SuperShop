import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/network_exceptions.dart';

//! Callable Class
abstract class BaseUseCase<T, parameters> {
  Future<Either<NetworkExceptions, T>> call(parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}
