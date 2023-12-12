import 'package:flutter/material.dart';
import 'package:practice_1/data/user_provider.dart';
import 'package:practice_1/design/gastos_texts.dart';
import 'package:practice_1/design/practice_one_colors.dart';
import 'package:practice_1/mocks/transactions_mocks.dart';

import 'package:practice_1/widgets/app_bar_items.dart';
import 'package:practice_1/widgets/buttons_row.dart';
import 'package:practice_1/widgets/categories.dart';
import 'package:practice_1/widgets/money_display.dart';
import 'package:practice_1/widgets/transactions_details.dart';
import 'package:practice_1/widgets/summary_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var buttonStyleInactive = ElevatedButton.styleFrom(
      elevation: 0, backgroundColor: GastosColors.brandLightColor, shadowColor: GastosColors.brandLightColor);
  var buttonStyleActive = ElevatedButton.styleFrom(
      backgroundColor: GastosColors.brandSecondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // <-- Radius
      ));
  Widget currentDetailWidget = const Categories();
  late ButtonStyle categorieBtnStyle;
  late ButtonStyle recentTransactionsBtnStyle;
  @override
  void initState() {
    super.initState();
    categorieBtnStyle = buttonStyleActive;
    recentTransactionsBtnStyle = buttonStyleInactive;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 97,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        backgroundColor: GastosColors.brandLightColor,
        title: AppBarItems(storeName: UserProvider.of(context).userData.name),
      ),
      body: Column(
        children: [
          const TopHomePageBody(),
          MidHomePageBody(
            categorieBtnStyle: categorieBtnStyle,
            recentTransactionsBtnStyle: recentTransactionsBtnStyle,
            categoriesBtnAction: () {
              setState(() {
                currentDetailWidget = const Categories();
                categorieBtnStyle = buttonStyleActive;
                recentTransactionsBtnStyle = buttonStyleInactive;
              });
            },
            recentBtnAction: () {
              setState(() {
                currentDetailWidget = TransactionsDetails(
                  listOftransactions: TransactionsMocks.recentTransactions,
                );
                categorieBtnStyle = buttonStyleInactive;
                recentTransactionsBtnStyle = buttonStyleActive;
              });
            },
          ),
          currentDetailWidget,
        ],
      ),
    );
  }
}

class MidHomePageBody extends StatelessWidget {
  const MidHomePageBody({
    super.key,
    required this.categorieBtnStyle,
    required this.recentTransactionsBtnStyle,
    this.categoriesBtnAction,
    this.recentBtnAction,
  });
  final ButtonStyle categorieBtnStyle;
  final ButtonStyle recentTransactionsBtnStyle;
  final void Function()? categoriesBtnAction;
  final void Function()? recentBtnAction;

  @override
  Widget build(BuildContext context) {
    return ButtonsRow(
      categorieBtnStyle: categorieBtnStyle,
      recentTransactionsBtnStyle: recentTransactionsBtnStyle,
      categoriesBtnAction: categoriesBtnAction,
      recentBtnAction: recentBtnAction,
    );
  }
}

class TopHomePageBody extends StatelessWidget {
  const TopHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 360,
      transform: Matrix4.translationValues(0, -13, 0), // allow to move up the widget
      decoration: const BoxDecoration(
          color: GastosColors.brandPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            GastosTexts.yourBudget,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        MoneyDipslay(
          amount: 2868000.12,
          padding: const EdgeInsets.only(top: 8, right: 4),
          amountStyle: Theme.of(context).textTheme.displayLarge!.copyWith(color: GastosColors.brandLightColor),
          amountStyleSmall: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: GastosColors.brandLightColor,
          ),
        ),
        SummaryCard(
          typeSummaryCard: TypeSummaryCard.incomes,
          amount: 700000,
          period: 'From January 1 to January 31',
          action: () => print('incomes'),
        ),
        SummaryCard(
          typeSummaryCard: TypeSummaryCard.spending,
          amount: 90000,
          period: 'From January 1 to January 31',
          action: () => print('spending'),
        ),
      ]),
    );
  }
}
