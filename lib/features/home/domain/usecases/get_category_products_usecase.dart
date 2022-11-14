import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/network_exceptions.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/categories/get_category_products.dart';
import '../repository/home_base_repository.dart';

class GetCategoryProductsUseCase extends BaseUseCase<GetCategoryProducts,
    GetCategoryProductsUseCaseParameters> {
  final HomeBaseRepository repository;

  GetCategoryProductsUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, GetCategoryProducts>> call(
      GetCategoryProductsUseCaseParameters parameters) async {
    return await repository.getCategoryProducts(parameters);
  }
}

class GetCategoryProductsUseCaseParameters extends Equatable {
  final int id;
  const GetCategoryProductsUseCaseParameters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
