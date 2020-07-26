import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/transactions_list.dart';

import 'services/transaction_service.dart';
import 'widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'domain/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.blue,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(fontFamily: 'OpenSans', fontSize: 18)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    button: TextStyle(color: Colors.white),
                  )),
          errorColor: Colors.red),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TransactionService transactionService = TransactionService();

  void showAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewTransaction(
          addNewTransaction: this._addNewTransaction,
        );
      },
    );
  }

  void _addNewTransaction(Transaction transaction) {
    setState(() {
      transactionService.addTransaction(transaction);
    });
  }

  void _deleteTransaction(Transaction transaction) {
    setState(() {
      transactionService.deleteTransaction(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => this.showAddNewTransaction(context),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Chart(recentTransactions: this.transactionService.recentTransactions),
          Expanded(
            child: TransactionsList(
              transactionService: this.transactionService,
              deleteTransaction: this._deleteTransaction,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => this.showAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
