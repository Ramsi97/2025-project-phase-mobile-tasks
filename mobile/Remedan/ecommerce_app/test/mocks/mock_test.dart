import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/features/products/data/datasources/product_local_data_source.dart';
import 'package:ecommerce_app/features/products/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

// This line is crucial — use the exact test file name before `.mocks.dart`
@GenerateMocks([
  ProductRepository,
  NetworkInfo,
  ProductRemoteDataSource,
  ProductLocalDataSource,
  http.Client,
  SharedPreferences,
  InternetConnectionChecker,
])
// The main function is needed for the build_runner to work correctly
void main() {
  // Your tests go here
}
