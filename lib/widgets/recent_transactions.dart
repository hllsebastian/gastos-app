import 'package:flutter/material.dart';
import 'package:practice_1/config/app_routes.dart';
import 'package:practice_1/design/gastos_texts.dart';

enum RecentTransactionsType { incomes, outcomes }

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({
    super.key,
    required this.movementDate,
    required this.amount,
    required this.movementName,
    required this.transactionType,
  });
  final DateTime movementDate;
  final double amount;
  final String movementName;
  final RecentTransactionsType transactionType;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    // TODO: transaction date and text formaters
    return Expanded(
      child: ListView(children: [
        TextButton(
          style: const ButtonStyle(alignment: Alignment.centerRight),
          child: Text(
            GastosTexts.viewAll,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(53, 97, 254, 1)),
          ),
          onPressed: () {
            print('le diste clic a view all');
            Navigator.pushNamed(context, AppRoutes.allTransactionsPage);
          },
        ),
        RecentTransactionsCard(
          transactionType: transactionType,
          movementName: movementName,
          textStyle: textStyle,
          movementDate: movementDate,
          amount: amount,
        ),
        RecentTransactionsCard(
          transactionType: transactionType,
          movementName: movementName,
          textStyle: textStyle,
          movementDate: movementDate,
          amount: amount,
        ),
        RecentTransactionsCard(
          transactionType: transactionType,
          movementName: movementName,
          textStyle: textStyle,
          movementDate: movementDate,
          amount: amount,
        ),
      ]),
    );
  }
}

class RecentTransactionsCard extends StatelessWidget {
  const RecentTransactionsCard({
    super.key,
    required this.transactionType,
    required this.movementName,
    required this.textStyle,
    required this.movementDate,
    required this.amount,
  });

  final RecentTransactionsType transactionType;
  final String movementName;
  final TextTheme textStyle;
  final DateTime movementDate;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Icon(
              transactionType == RecentTransactionsType.incomes ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: Colors.red,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movementName, style: textStyle.displayMedium!.copyWith(color: Colors.black)),
              Text(movementDate.toString(), style: textStyle.displaySmall),
            ],
          ),
          Text(amount.toString(), style: textStyle.displaySmall!.copyWith(color: Colors.black)),
        ],
      ),
    );
  }
}
