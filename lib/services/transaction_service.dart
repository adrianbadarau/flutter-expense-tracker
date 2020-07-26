import 'package:expense_tracker/domain/transaction.dart';

class TransactionService {
  final List<Transaction> _transactions = [];

  List<Transaction> get recentTransactions {
    return _transactions.where((element) =>
        element.createdAt.isAfter(DateTime.now().subtract(Duration(days: 7)))).toList();
  }

  List<Transaction> getTransactions() {
    return _transactions;
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
  }

  void deleteTransaction(Transaction transaction){
    _transactions.remove(transaction);
  }
}
