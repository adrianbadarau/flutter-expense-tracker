import 'package:expense_tracker/domain/transaction.dart';
import 'package:expense_tracker/services/transaction_service.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final Function addNewTransaction;

  NewTransaction({Function addNewTransaction})
      : this.addNewTransaction = addNewTransaction;

  void submitData() {
    var transaction = Transaction(
        createdAt: DateTime.now(),
        amount: double.parse(_amountController.text),
        title: _titleController.text,
        id: "${_titleController.text} and ${_amountController.text} and ${DateTime.now().toString()}");
    addNewTransaction(transaction);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add transaction'),
              onPressed: submitData,
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
