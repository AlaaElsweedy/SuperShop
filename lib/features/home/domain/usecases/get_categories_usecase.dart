import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/usecase/base_use_case.dart';

import 'package:dartz/dartz.dart';
import 'package:supershop/features/home/domain/entities/categories/categories.dart';
import '../repository/home_base_repository.dart';

class GetCategoriesUseCase extends BaseUseCase<Categories, NoParameters> {
  final HomeBaseRepository homeBaseRepository;

  GetCategoriesUseCase(this.homeBaseRepository);

  @override
  Future<Either<NetworkExceptions, Categories>> call(
    NoParameters parameters,
  ) async {
    return await homeBaseRepository.getCategories();
  }
}
