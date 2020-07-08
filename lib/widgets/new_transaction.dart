import 'package:expense_tracker/domain/transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
              },
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
