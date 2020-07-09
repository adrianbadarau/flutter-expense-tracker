import 'package:expense_tracker/config/constants.dart';
import 'package:expense_tracker/domain/transaction.dart';
import 'package:expense_tracker/services/transaction_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  final TransactionService _transactionService;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
            children: _transactionService.getTransactions().map((Transaction tx) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "${tx.amount.toString()} $kMainCurrency",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple),
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.purple),
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tx.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                          .format(tx.createdAt),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          );
        }).toList()),
      ),
    );
  }

  TransactionsList({TransactionService transactionService})
      : this._transactionService = transactionService;
}
