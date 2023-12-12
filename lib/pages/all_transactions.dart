import 'package:flutter/material.dart';
import 'package:practice_1/design/gastos_texts.dart';
import 'package:practice_1/design/practice_one_colors.dart';
import 'package:practice_1/mocks/transactions_mocks.dart';
import 'package:practice_1/models/transaction_detail_mounth.dart';
import 'package:practice_1/widgets/transactions_details.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({super.key, this.listOftransactions});
  final List<TransactionDetailByMounth>? listOftransactions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 97,
        leadingWidth: 56,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12))),
        backgroundColor: GastosColors.brandLightColor,
        leading: Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.fromLTRB(16, 45, 0, 12),
          decoration: BoxDecoration(
              border: Border.all(color: GastosColors.brandLightColorBorder), borderRadius: BorderRadius.circular(12)),
          child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back,
                color: GastosColors.brandPrimaryColor,
              )),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 45, 16, 12),
          child: Text(
            GastosTexts.recentTrx,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        centerTitle: false,
      ),
      backgroundColor: GastosColors.brandLightColor,
      body: _AllTransactions(listOftransactions: listOftransactions),
    );
  }
}

class _AllTransactions extends StatelessWidget {
  const _AllTransactions({this.listOftransactions});
  final List<TransactionDetailByMounth>? listOftransactions;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const _AllTrxButtons(),
      TransactionsDetails(
        listOftransactions: TransactionsMocks.transactionsByMonth,
        isAllTrasactions: true,
      ),
    ]);
  }
}

class _AllTrxButtons extends StatelessWidget {
  const _AllTrxButtons();

  @override
  Widget build(BuildContext context) {
    TransactionsMocks.categories.sort();
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 32),
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemCount: TransactionsMocks.categories.length,
        itemBuilder: (context, index) {
          var currentCategorie = TransactionsMocks.categories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: MaterialButton(
                padding: const EdgeInsets.all(10),
                height: 35,
                minWidth: 35,
                color: index == 0 ? GastosColors.brandPrimaryColor : GastosColors.brandLightColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                onPressed: () {},
                child: Text(currentCategorie,
                    style: TextStyle(
                        color: index != 0 ? GastosColors.brandPrimaryColor : GastosColors.brandLightColor,
                        fontSize: 13))),
          );
        },
      ),
    );
  }
}
