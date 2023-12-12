import 'package:practice_1/models/transaction_detail.dart';
import 'package:practice_1/models/transaction_detail_mounth.dart';
import 'package:practice_1/widgets/recent_transactions.dart';

class TransactionsMocks {
  const TransactionsMocks._();
  static List<String> categories = [
    'Shop',
    'Video Games',
    'Electronics',
    'Books',
    'Transportation',
    'All',
    'Food And Drink',
  ];
  static List<TransactionDetailByMounth> recentTransactions = [
    const TransactionDetailByMounth(
      day: 'Monday',
      mounth: 'November',
      dayNumber: 2,
      isToday: false,
      listofTransactions: [
        TransactionDetail(
          movementName: 'buy',
          transactionDate: 'monday ',
          transactionType: TransactionType.positive,
          amount: 456,
        ),
        TransactionDetail(
          movementName: 'buy',
          transactionDate: 'monday ',
          transactionType: TransactionType.negative,
          amount: 456,
        ),
        TransactionDetail(
          movementName: 'buy',
          transactionDate: 'monday ',
          transactionType: TransactionType.positive,
          amount: 456,
        ),
        TransactionDetail(
          movementName: 'buy',
          transactionDate: 'monday ',
          transactionType: TransactionType.negative,
          amount: 456,
        ),
      ],
    ),
  ];
  static List<TransactionDetailByMounth> transactionsByMonth = [
    const TransactionDetailByMounth(
      day: 'Monday',
      mounth: 'November',
      dayNumber: 2,
      isToday: false,
      listofTransactions: [
        TransactionDetail(
          movementName: 'buy',
          transactionDate: 'monday ',
          transactionType: TransactionType.positive,
          amount: 456,
        ),
        TransactionDetail(
          movementName: 'buy',
          transactionDate: 'monday ',
          transactionType: TransactionType.positive,
          amount: 456,
        ),
        TransactionDetail(
          movementName: 'buy',
          transactionDate: 'monday ',
          transactionType: TransactionType.positive,
          amount: 456,
        ),
        TransactionDetail(
          movementName: 'buy',
          transactionDate: 'monday ',
          transactionType: TransactionType.positive,
          amount: 456,
        ),
      ],
    ),
    const TransactionDetailByMounth(
      day: 'Monday',
      mounth: 'November',
      dayNumber: 2,
      isToday: false,
      listofTransactions: [
        TransactionDetail(
          movementName: 'buy',
          transactionDate: 'monday ',
          transactionType: TransactionType.positive,
          amount: 456,
        ),
      ],
    ),
    const TransactionDetailByMounth(
      day: 'Monday',
      mounth: 'November',
      dayNumber: 2,
      isToday: false,
      listofTransactions: [
        TransactionDetail(
          movementName: 'buy',
          transactionDate: 'monday ',
          transactionType: TransactionType.positive,
          amount: 456,
        ),
      ],
    ),
    const TransactionDetailByMounth(
      day: 'Monday',
      mounth: 'November',
      dayNumber: 2,
      isToday: false,
      listofTransactions: [
        TransactionDetail(
          movementName: 'buy',
          transactionDate: 'monday ',
          transactionType: TransactionType.positive,
          amount: 456,
        ),
      ],
    ),
  ];
}
