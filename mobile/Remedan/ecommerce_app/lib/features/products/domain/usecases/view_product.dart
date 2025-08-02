import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ViewProduct implements Usecase<Product?, String> {
  final ProductRepository repository;

  ViewProduct(this.repository);

  @override
  Future<Either<Failure, Product?>> call(String id) async {
    return await repository.getProductById(id);
  }
}
