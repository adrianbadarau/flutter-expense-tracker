import 'package:expense_tracker/domain/transaction.dart';

class TransactionService {
  final List<Transaction> _transactions = [];

  List<Transaction> getTransactions() {
    return _transactions;
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
  }
}
