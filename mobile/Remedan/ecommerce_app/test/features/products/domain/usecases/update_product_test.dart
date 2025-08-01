import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/products/domain/usecases/update_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late UpdateProduct usecase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    usecase = UpdateProduct(mockRepo);
  });

  final tProduct = const Product(
    id: '1',
    name: 'Updated Shoes',
    description: 'Updated description',
    price: 99.99,
    imageUrl: 'updated.png',
  );

  test('should call updateProduct on repository', () async {
    when(
      mockRepo.updateProduct(tProduct),
    ).thenAnswer((_) async => Future.value());

    await usecase(tProduct);

    verify(mockRepo.updateProduct(tProduct));
    verifyNoMoreInteractions(mockRepo);
  });
}
