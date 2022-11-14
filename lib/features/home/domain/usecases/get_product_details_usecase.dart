import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/network_exceptions.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/products/get_product_details.dart';
import '../repository/home_base_repository.dart';

class GetProductDetailsUseCase
    extends BaseUseCase<GetProductDetails, GetProductDetailsUseCaseParameters> {
  final HomeBaseRepository repository;

  GetProductDetailsUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, GetProductDetails>> call(
      GetProductDetailsUseCaseParameters parameters) async {
    return await repository.getProductDetails(parameters);
  }
}

class GetProductDetailsUseCaseParameters extends Equatable {
  final int id;
  const GetProductDetailsUseCaseParameters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
