import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/network_exceptions.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/products/search_product.dart';
import '../repository/home_base_repository.dart';

class SearchProductsUseCase
    extends BaseUseCase<SearchProduct, SearchProductsUseCaseParameters> {
  final HomeBaseRepository repository;

  SearchProductsUseCase(this.repository);

  @override
  Future<Either<NetworkExceptions, SearchProduct>> call(
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
