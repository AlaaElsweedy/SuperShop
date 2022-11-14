import 'package:dartz/dartz.dart';

import '../../../../core/error/network_exceptions.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/categories/get_categories.dart';
import '../repository/home_base_repository.dart';

class GetCategoriesUseCase extends BaseUseCase<GetCategories, NoParameters> {
  final HomeBaseRepository homeBaseRepository;

  GetCategoriesUseCase(this.homeBaseRepository);

  @override
  Future<Either<NetworkExceptions, GetCategories>> call(
    NoParameters parameters,
  ) async {
    return await homeBaseRepository.getCategories();
  }
}
