import 'package:expense_tracker/domain/transaction.dart';
import 'package:expense_tracker/widgets/chart_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartColumn {
  final String day;
  final double amount;
  final double procOfTotal;

  ChartColumn({this.procOfTotal, this.day, this.amount});
}

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart({this.recentTransactions});

  List<ChartColumn> get groupedTransactionValues {
    final total = recentTransactions.fold(
        0, (previousValue, element) => previousValue + element.amount);
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double sum = recentTransactions
          .where((element) =>
              element.createdAt.difference(weekDay).inHours + 1 < 24)
          .fold(0, (previousValue, element) => previousValue + element.amount);
      double procOfTotal = (sum > 0 || total > 0) ? sum / total : 0;
      return ChartColumn(
          day: DateFormat.E().format(weekDay),
          amount: sum,
          procOfTotal: procOfTotal);
    });
  }

  List<Widget> buildChartItems() {
    return this.groupedTransactionValues.map((column) {
      return Flexible(
        fit: FlexFit.tight,
        child: ChartBar(
          label: column.day,
          spendingAmount: column.amount,
          spendingProcOfTotal: column.procOfTotal,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: buildChartItems(),
        ),
      ),
    );
  }
}
