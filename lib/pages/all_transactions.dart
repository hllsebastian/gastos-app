import 'package:flutter/material.dart';
import 'package:practice_1/design/practice_one_colors.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({super.key});

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
            'WeinfluCopys.recenTrx',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        centerTitle: false,
      ),
      backgroundColor: GastosColors.brandLightColor,
      body: Column(children: [
        Container(
          height: 56,
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 32),
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, indice) {
              // var currentCategorie = TransactionsMocks.categories[indice];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: MaterialButton(
                    padding: const EdgeInsets.all(10),
                    height: 35,
                    minWidth: 35,
                    color: indice == 0 ? GastosColors.brandPrimaryColor : GastosColors.brandLightColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    onPressed: () {},
                    child: Text('currentCategorie',
                        style: TextStyle(
                            color: indice != 0 ? GastosColors.brandPrimaryColor : GastosColors.brandLightColor,
                            fontSize: 13))),
              );
            },
            itemCount: 5,
            // itemCount: TransactionsMocks.categories.length,
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, month) {
              print('vamos en el mes $month');
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, day) {
                  print('vamos en el dia $day');
                  // var currentday = TransactionsMocks
                  //     .transactionDetailByMonth[month]
                  //     .listofTransactions[day];
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    // child: TransactionDetailByDay(
                    //     listofTransactions: currentday.listofTransactions,
                    //     day: currentday.day,
                    //     isToday: currentday.isToday,
                    //     dayNumber: currentday.dayNumber),
                  );
                },
                separatorBuilder: (context, indice) => const SizedBox(
                  height: 24,
                ),
                itemCount: 3,
                // itemCount: TransactionsMocks
                //     .transactionDetailByMonth[month]
                //     .listofTransactions.length
              );
            },
            separatorBuilder: (context, month) => const Padding(
              padding: EdgeInsets.fromLTRB(16, 54, 16, 24),
              // child: DividerWithText(
              //     title: TransactionsMocks
              //         .transactionDetailByMonth[month + 1].month),
            ),
            itemCount: 3,
            // itemCount:
            //     TransactionsMocks.transactionDetailByMonth.length
          ),
        ),
      ]),
    );
  }
}
