class PricingRepository {
  static const double sixInchPrice = 7.0;
  static const double footlongPrice = 11.0;

  double calculateTotal({required int quantity, required bool isFootlong}) {
    final pricePerSandwich = isFootlong ? footlongPrice : sixInchPrice;
    return quantity * pricePerSandwich;
  }
}
