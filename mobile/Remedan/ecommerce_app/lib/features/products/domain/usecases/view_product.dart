import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ViewProduct {
  final ProductRepository repository;

  ViewProduct(this.repository);

  Future<Either<Failure, Product?>> call(String id) async {
    return await repository.getProductById(id);
  }
}
