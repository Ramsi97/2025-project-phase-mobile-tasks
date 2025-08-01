import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<Either<Failure, List<ProductModel>>> getCachedProducts();
  Future<Either<Failure, void>> cacheProducts(List<ProductModel> products);
}
