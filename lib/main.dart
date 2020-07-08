import 'package:expense_tracker/domain/transaction.dart';
import 'package:expense_tracker/services/transaction_service.dart';
import 'package:expense_tracker/widgets/transactions_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final TransactionService transactionService = TransactionService();

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                  ),
                  FlatButton(
                    child: Text('Add transaction'),
                    onPressed: () {
                      var transaction = Transaction(
                          createdAt: DateTime.now(),
                          amount: double.parse(amountController.text),
                          title: titleController.text,
                          id: "${titleController.text} and ${amountController.text}");
                      transactionService.addTransaction(transaction);
                    },
                    textColor: Colors.purple,
                  )
                ],
              ),
            ),
          ),
          TransactionsWidget(),
        ],
      ),
    );
  }
}
