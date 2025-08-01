import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/products/domain/usecases/delete_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late DeleteProduct usecase;
  late MockProductRepository mockRepo;

  setUp(() {
    mockRepo = MockProductRepository();
    usecase = DeleteProduct(mockRepo);
  });

  const tProductId = '1';

  test('should call deleteProduct on repository', () async {
    when(
      mockRepo.deleteProduct(tProductId),
    ).thenAnswer((_) async => Future.value(const Right(null)));

    await usecase(tProductId);

    verify(mockRepo.deleteProduct(tProductId));
    verifyNoMoreInteractions(mockRepo);
  });
}
