import 'package:flutter/material.dart';
import 'package:practice_1/design/gastos_themes.dart';
import 'package:practice_1/design/practice_one_colors.dart';
import 'package:practice_1/widgets/money_display.dart';

enum TypeSummaryCard { incomes, spending }

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.typeSummaryCard,
    required this.amount,
    required this.period,
    required this.action,
  });
  final TypeSummaryCard typeSummaryCard;
  final double amount;
  final String period;
  final void Function()? action;

  @override
  Widget build(BuildContext context) {
    var incomesIcon = const Icon(
      Icons.arrow_upward,
      color: GastosColors.brandOnSuccessColor,
    );
    var spendingIcon = const Icon(Icons.arrow_downward, color: GastosColors.brandOnErrorColor);

    return Container(
      height: 92,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: GastosColors.brandLightColorOpacity,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: GastosThemes.borderRadius,
                border: Border.all(color: GastosColors.brandPrimaryColor)),
            child: typeSummaryCard == TypeSummaryCard.incomes ? incomesIcon : spendingIcon),
        Expanded(
          child: Text(
            typeSummaryCard == TypeSummaryCard.incomes ? 'Incomes' : 'Spending',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            MoneyDipslay(
                padding: const EdgeInsets.only(top: 2, right: 5),
                amount: amount,
                amountStyle: Theme.of(context).textTheme.displayMedium!,
                amountStyleSmall: Theme.of(context).textTheme.displaySmall!),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                period,
                style: const TextStyle(color: GastosColors.brandLightColor, fontFamily: 'RobotoMono', fontSize: 10),
              ),
            ),
          ]),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: GastosThemes.borderRadius, border: Border.all(color: GastosColors.brandLightColorBorder)),
          child: IconButton(
            icon: const Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
            onPressed: action,
          ),
        ),
      ]),
    );
  }
}
