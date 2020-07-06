import 'package:expense_tracker/domain/transaction.dart';
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
  final List<Transaction> transactions = [
    Transaction(
        id: 'id-1', title: 'Berries', amount: 99.5, createdAt: DateTime.now()),
    Transaction(
        id: 'id-2', title: 'Apples', amount: 22.0, createdAt: DateTime.now()),
    Transaction(
        id: 'id-3', title: 'Chicken', amount: 53.1, createdAt: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((Transaction tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Text(tx.amount.toString()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(tx.title),
                        Text(tx.createdAt.toString())
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
