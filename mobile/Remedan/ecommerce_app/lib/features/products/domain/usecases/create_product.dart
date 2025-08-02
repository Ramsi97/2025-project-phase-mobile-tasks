import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class CreateProduct implements Usecase<void, Product> {
  final ProductRepository repository;

  CreateProduct(this.repository);

  @override
  Future<Either<Failure, void>> call(Product product) async {
    return await repository.createProduct(product);
  }
}
