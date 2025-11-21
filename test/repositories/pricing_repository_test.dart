import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    late PricingRepository repository;

    setUp(() {
      repository = PricingRepository();
    });

    test('calculateTotal returns 0 for zero quantity', () {
      expect(repository.calculateTotal(quantity: 0, isFootlong: true), 0.0);
      expect(repository.calculateTotal(quantity: 0, isFootlong: false), 0.0);
    });

    test('calculateTotal returns correct price for one six-inch sandwich', () {
      expect(repository.calculateTotal(quantity: 1, isFootlong: false), 7.0);
    });

    test('calculateTotal returns correct price for one footlong sandwich', () {
      expect(repository.calculateTotal(quantity: 1, isFootlong: true), 11.0);
    });

    test(
        'calculateTotal returns correct price for multiple six-inch sandwiches',
        () {
      expect(repository.calculateTotal(quantity: 3, isFootlong: false), 21.0);
    });

    test(
        'calculateTotal returns correct price for multiple footlong sandwiches',
        () {
      expect(repository.calculateTotal(quantity: 5, isFootlong: true), 55.0);
    });

    test('calculateTotal handles mixed quantities correctly', () {
      expect(repository.calculateTotal(quantity: 2, isFootlong: false), 14.0);
      expect(repository.calculateTotal(quantity: 2, isFootlong: true), 22.0);
    });
  });
}
