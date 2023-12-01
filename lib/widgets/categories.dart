import 'package:flutter/material.dart';
import 'package:practice_1/config/app_routes.dart';
import 'package:practice_1/pages/new_page.dart';
import 'package:practice_1/widgets/product_detail_card.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          TextButton(
            style: const ButtonStyle(alignment: Alignment.centerRight),
            child: const Text(
              'View All',
              style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(53, 97, 254, 1)),
            ),
            onPressed: () {
              print('le diste clic a view all');
              Navigator.of(context).pushNamed(AppRoutes.newpage);
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewPage()));
            },
          ),
          const ProductDetailCard(
            pathToProductImage: 'assets/images/pizza_icon.png',
            amount: 391254.01,
            productName: 'Food & Drink',
            currentSells: '2250',
            percentage: '1.8',
            typeProductDetailCard: TypeProductDetailCard.incomes,
          ),
          const ProductDetailCard(
            typeProductDetailCard: TypeProductDetailCard.incomes,
            pathToProductImage: 'assets/images/electronic_icon.png',
            amount: 3176254.01,
            productName: 'Electronics',
            currentSells: '2250',
            percentage: '43.6',
          ),
          const ProductDetailCard(
            typeProductDetailCard: TypeProductDetailCard.outcomes,
            pathToProductImage: 'assets/images/fruit_icon.png',
            amount: 38.01,
            productName: 'Health',
            currentSells: '110',
            percentage: '25.8',
          ),
        ],
      ),
    );
  }
}
