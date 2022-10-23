import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';
import 'package:supershop/features/home/domain/entities/products/search_product.dart';
import 'package:supershop/features/home/domain/repository/home_base_repository.dart';

class SearchProductsUseCase
    extends BaseUseCase<List<SearchProduct>, SearchProductsUseCaseParameters> {
  final HomeBaseRepository repository;

  SearchProductsUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, List<SearchProduct>>> call(
    SearchProductsUseCaseParameters parameters,
  ) async {
    return await repository.searchProducts(parameters);
  }
}

class SearchProductsUseCaseParameters extends Equatable {
  final String title;
  const SearchProductsUseCaseParameters({
    required this.title,
  });

  @override
  List<Object> get props => [title];
}
