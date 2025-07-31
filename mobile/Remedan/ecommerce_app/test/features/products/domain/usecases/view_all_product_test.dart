import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/products/domain/usecases/view_all_products.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late ViewAllProducts usecase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    usecase = ViewAllProducts(mockRepo);
  });

  final tProductList = [
    const Product(
      id: '1',
      name: 'Shoes',
      description: 'Comfortable shoes',
      price: 100.0,
      imageUrl: 'shoes.png',
    ),
    const Product(
      id: '2',
      name: 'Bag',
      description: 'Stylish bag',
      price: 75.0,
      imageUrl: 'bag.png',
    ),
  ];

  test('should return list of products from repository', () async {
    when(mockRepo.getAllProducts()).thenAnswer((_) async => tProductList);

    final result = await usecase();

    expect(result, tProductList);
    verify(mockRepo.getAllProducts());
    verifyNoMoreInteractions(mockRepo);
  });
}
