import 'package:expense_tracker/config/constants.dart';
import 'package:expense_tracker/domain/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final List<Transaction> transactions = [
    Transaction(
        id: 'id-1', title: 'Berries', amount: 99.5, createdAt: DateTime.now()),
    Transaction(
        id: 'id-2', title: 'Apples', amount: 22.0, createdAt: DateTime.now()),
    Transaction(
        id: 'id-3', title: 'Chicken', amount: 53.1, createdAt: DateTime.now()),
  ];
  
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
                        id: "${titleController.text} and ${amountController.text}"
                      );
                      transactions.add(transaction);
                    },
                    textColor: Colors.purple,
                  )
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((Transaction tx) {
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
            }).toList(),
          ),
        ],
      ),
    );
  }
}
