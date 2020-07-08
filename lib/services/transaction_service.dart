import 'package:expense_tracker/domain/transaction.dart';

class TransactionService {
  final List<Transaction> _transactions = [
    Transaction(
        id: 'id-1', title: 'Berries', amount: 99.5, createdAt: DateTime.now()),
    Transaction(
        id: 'id-2', title: 'Apples', amount: 22.0, createdAt: DateTime.now()),
    Transaction(
        id: 'id-3', title: 'Chicken', amount: 53.1, createdAt: DateTime.now()),
  ];

  List<Transaction> getTransactions() {
    return _transactions;
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
  }
}
