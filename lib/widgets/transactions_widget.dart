import 'package:expense_tracker/config/constants.dart';
import 'package:expense_tracker/domain/transaction.dart';
import 'package:expense_tracker/services/transaction_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsWidget extends StatefulWidget {
  @override
  _TransactionsWidgetState createState() => _TransactionsWidgetState(TransactionService().getTransactions());
}

class _TransactionsWidgetState extends State<TransactionsWidget> {
  final List<Transaction> _transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _transactions.map((Transaction tx) {
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
    }).toList());
  }

  _TransactionsWidgetState(this._transactions);
}
