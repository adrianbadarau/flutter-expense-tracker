import 'package:expense_tracker/config/constants.dart';
import 'package:expense_tracker/services/transaction_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  final TransactionService _transactionService;
  final Function _deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: _transactionService.getTransactions().isEmpty
          ? Column(children: <Widget>[
              Text(
                'There are no items yet',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 10),
              Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ))
            ])
          : ListView.builder(
              itemBuilder: (context, index) {
                var tx = _transactionService.getTransactions()[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${tx.amount.toStringAsFixed(2)} $kMainCurrency",
                          ),
                        ),
                      ),
                    ),
                    title: Text(tx.title,
                        style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(
                      DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                          .format(tx.createdAt),
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                      ),
                      onPressed: () => _deleteTransaction(tx),
                    ),
                  ),
                );
              },
              itemCount: _transactionService.getTransactions().length,
            ),
    );
  }

  TransactionsList(
      {TransactionService transactionService, Function deleteTransaction})
      : this._transactionService = transactionService,
        this._deleteTransaction = deleteTransaction;
}
