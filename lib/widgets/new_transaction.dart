import 'package:expense_tracker/domain/transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction({@required Function addNewTransaction})
      : this.addNewTransaction = addNewTransaction;

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void submitData() {
    var transaction = Transaction(
      createdAt: DateTime.now(),
      amount: double.parse(_amountController.text),
      title: _titleController.text,
      id: "${_titleController.text} and ${_amountController.text} and ${DateTime.now().toString()}",
    );
    widget.addNewTransaction(transaction);
    Navigator.of(context).pop();
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
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text('No date chosen'),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            FlatButton(
              child: Text('Add transaction'),
              onPressed: submitData,
              textColor: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
