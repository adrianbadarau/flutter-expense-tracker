import 'package:expense_tracker/domain/transaction.dart';
import 'package:expense_tracker/services/transaction_service.dart';
import 'package:flutter/material.dart';

import 'new_transaction.dart';
import 'transactions_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final _transactionService = TransactionService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addNewTransaction: this._addNewTransaction),
        TransactionsList(transactionService: _transactionService),
      ],
    );
  }

  void _addNewTransaction(Transaction transaction) {
    setState(() {
      _transactionService.addTransaction(transaction);
    });
  }
}
