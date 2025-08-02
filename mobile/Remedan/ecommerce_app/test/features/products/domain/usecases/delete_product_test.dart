import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products/domain/usecases/delete_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'delete_product_test.mocks.dart';

void main() {
  late MockProductRepository mockRepo;
  late DeleteProduct usecase;

  setUp(() {
    mockRepo = MockProductRepository();
    usecase = DeleteProduct(mockRepo);
  });

  final tProductId = '1';

  test('should call deleteProduct on repository', () async {
    when(
      mockRepo.deleteProduct(tProductId),
    ).thenAnswer((_) async => const Right(null));

    final result = await usecase(tProductId);

    expect(result, const Right(null));
    verify(mockRepo.deleteProduct(tProductId));
    verifyNoMoreInteractions(mockRepo);
  });
}
