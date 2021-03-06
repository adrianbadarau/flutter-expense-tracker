import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingProcOfTotal;

  ChartBar({this.label, this.spendingAmount, this.spendingProcOfTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 20,
            child:
                FittedBox(child: Text("${spendingAmount.toStringAsFixed(0)}"))),
        SizedBox(height: 4),
        Container(
          width: 10,
          height: 60,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: spendingProcOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(label)
      ],
    );
  }
}
