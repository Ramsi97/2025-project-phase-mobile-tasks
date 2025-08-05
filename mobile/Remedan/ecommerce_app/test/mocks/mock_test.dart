import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/features/products/data/datasources/product_local_data_source.dart';
import 'package:ecommerce_app/features/products/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:mockito/annotations.dart';

// This line is crucial — use the exact test file name before `.mocks.dart`
@GenerateMocks([
  ProductRepository,
  NetworkInfo,
  ProductRemoteDataSource,
  ProductLocalDataSource,
])
// The main function is needed for the build_runner to work correctly
void main() {
  // Your tests go here
}
