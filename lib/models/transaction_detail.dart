enum TransactionType { positive, negative }
// enum RecentTransactionsType { incomes, outcomes }

class TransactionDetail {
  const TransactionDetail({
    required this.amount,
    required this.movementName,
    required this.transactionDate,
    required this.transactionType,
  });
  final double amount;
  final String movementName;
  final String transactionDate;
  final TransactionType transactionType;
}
