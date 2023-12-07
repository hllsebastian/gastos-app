import 'package:flutter/material.dart';
import 'package:practice_1/design/practice_one_colors.dart';
import 'package:practice_1/widgets/app_bar_items.dart';
import 'package:practice_1/widgets/buttons_row.dart';
import 'package:practice_1/widgets/categories.dart';
import 'package:practice_1/widgets/money_display.dart';
import 'package:practice_1/widgets/recent_transactions.dart';
import 'package:practice_1/widgets/summary_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.storeName});
  final String storeName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var buttonStyleInactive = ElevatedButton.styleFrom(
      elevation: 0, backgroundColor: PracticeOneColors.brandLightColor, shadowColor: PracticeOneColors.brandLightColor);
  var buttonStyleActive = ElevatedButton.styleFrom(
      backgroundColor: PracticeOneColors.brandSecondaryColor,
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
        backgroundColor: PracticeOneColors.brandLightColor,
        title: AppBarItems(storeName: widget.storeName),
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
                currentDetailWidget = RecentTransactions(
                  movementDate: DateTime.now(),
                  amount: 350.9,
                  movementName: 'Pizza',
                  transactionType: RecentTransactionsType.incomes,
                );
                categorieBtnStyle = buttonStyleInactive;
                recentTransactionsBtnStyle = buttonStyleActive;
              });
            },
          ),
          // RecentTransactions(
          //   movementDate: DateTime.now(),
          //   amount: 350.9,
          //   movementName: 'Pizza',
          //   transactionType: RecentTransactionsType.incomes,
          // )
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
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      transform: Matrix4.translationValues(0, -13, 0), // allow to move up the widget
      decoration: const BoxDecoration(
          color: PracticeOneColors.brandPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )),
      height: 389,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            margin: const EdgeInsets.only(top: 56),
            child: Text(
              'Your Budget',
              style: Theme.of(context).textTheme.displaySmall,
            )),
        MoneyDipslay(
          amount: 2868000.12,
          padding: const EdgeInsets.only(top: 8, right: 4),
          amountStyle: Theme.of(context).textTheme.displayLarge!.copyWith(color: PracticeOneColors.brandLightColor),
          amountStyleSmall: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: PracticeOneColors.brandLightColor,
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
