import 'package:practice_1/models/transaction_detail.dart';

class TransactionDetailByMounth {
  const TransactionDetailByMounth({
    required this.day,
    required this.mounth,
    required this.dayNumber,
    required this.isToday,
    required this.listofTransactions,
  });
  final String day;
  final String mounth;
  final int dayNumber;

  final bool isToday;
  final List<TransactionDetail> listofTransactions;
}
