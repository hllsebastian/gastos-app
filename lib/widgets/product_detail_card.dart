import 'package:flutter/material.dart';
import 'package:practice_1/design/gastos_themes.dart';

enum TypeProductDetailCard { incomes, outcomes }

class ProductDetailCard extends StatelessWidget {
  const ProductDetailCard({
    super.key,
    required this.amount,
    required this.pathToProductImage,
    required this.productName,
    required this.currentSells,
    required this.percentage,
    required this.typeProductDetailCard,
  });
  final double amount;
  final String pathToProductImage;
  final String productName;
  final String currentSells;
  final String percentage;
  final TypeProductDetailCard typeProductDetailCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: GastosThemes.borderRadius,
              border: Border.all(color: Colors.black12),
            ),
            child: Image.asset(pathToProductImage),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    productName,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                Text(
                  '\$${amount.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  '$currentSells sells',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: GastosThemes.borderRadius,
              border: Border.all(color: Colors.black12),
            ),
            child: typeProductDetailCard == TypeProductDetailCard.incomes
                ? const Icon(
                    Icons.arrow_upward,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.arrow_downward,
                    color: Colors.red,
                  ),
          ),
          Text(
            '$percentage%',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
