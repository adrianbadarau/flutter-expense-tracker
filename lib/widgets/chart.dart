import 'package:expense_tracker/domain/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartColumn {
  final String day;
  final double amount;

  ChartColumn({this.day, this.amount});
}

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart({this.recentTransactions});

  List<ChartColumn> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double sum = recentTransactions
          .where((element) => element.createdAt.difference(weekDay).inDays == 0)
          .fold(0, (previousValue, element) => previousValue + element.amount);
      return ChartColumn(day: DateFormat.E().format(weekDay), amount: sum);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[

        ],
      ),
    );
  }
}
