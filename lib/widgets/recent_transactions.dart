import 'package:flutter/material.dart';
import 'package:practice_1/config/app_routes.dart';
import 'package:practice_1/design/gastos_texts.dart';
import 'package:practice_1/models/transaction_detail.dart';
import 'package:practice_1/models/transaction_detail_mounth.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key, this.listOftransactions});
  final List<TransactionDetailByMounth>? listOftransactions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          const ViewAllButton(),
          RecentTransactionsItem(listOftransactions: listOftransactions),
        ],
      ),
    );
  }
}

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: TextButton(
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
    );
  }
}

class RecentTransactionsItem extends StatelessWidget {
  const RecentTransactionsItem({super.key, this.listOftransactions});
  final List<TransactionDetailByMounth>? listOftransactions;

  @override
  Widget build(BuildContext context) {
    // String formattedDate = DateFormat('EEEE d, MMM, y').format(DateTime.now());
    final textStyle = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.75,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listOftransactions?.length ?? 0,
          separatorBuilder: (context, index) => const Divider(color: Colors.red),
          itemBuilder: (context, index) {
            final detailItem = listOftransactions?[index];
            final dayShortName = detailItem?.day.substring(0, 3);
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    '$dayShortName\n${detailItem?.dayNumber.toString()}',
                    style: textStyle.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                _RecentTransactionDetails(
                  itemIndex: index,
                  listOftransactions: listOftransactions,
                  textStyle: textStyle,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _RecentTransactionDetails extends StatelessWidget {
  const _RecentTransactionDetails({
    required this.itemIndex,
    required this.listOftransactions,
    required this.textStyle,
    // required this.formattedDate,
  });

  final int itemIndex;
  final List<TransactionDetailByMounth>? listOftransactions;
  final TextTheme textStyle;
  // final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      // padding: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      width: MediaQuery.sizeOf(context).width * 0.8,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listOftransactions?[itemIndex].listofTransactions.length ?? 0,
          separatorBuilder: (context, index) => const Divider(color: Colors.blue),
          itemBuilder: (context, detailIndex) {
            final transactionDetail = listOftransactions?[itemIndex].listofTransactions[detailIndex];
            final detailDate =
                '${listOftransactions?[itemIndex].day} ${listOftransactions?[itemIndex].dayNumber.toString()}, ${listOftransactions?[itemIndex].mounth} ';
            return Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: transactionDetail?.transactionType == TransactionType.positive
                        ? Colors.green.shade100
                        : Colors.red.shade100,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Icon(
                    transactionDetail?.transactionType == TransactionType.positive
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: transactionDetail?.transactionType == TransactionType.positive ? Colors.green : Colors.red,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transactionDetail?.movementName ?? '',
                        style: textStyle.displayMedium!.copyWith(color: Colors.black)),
                    Text(detailDate, style: textStyle.displaySmall!.copyWith(color: Colors.grey.shade700)),
                  ],
                ),
                const SizedBox(width: 30),
                Text(
                  transactionDetail?.amount.toString() ?? '',
                  style: textStyle.displaySmall!.copyWith(
                      color:
                          transactionDetail?.transactionType == TransactionType.positive ? Colors.black : Colors.red),
                ),
              ],
            );
          }),
    );
  }
}
