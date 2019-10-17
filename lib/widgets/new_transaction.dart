import 'package:flutter/material.dart';

/*
Class Objective:
  1. Provide/return a 'Card' widget that allow user to input 'transaction amount' and 'transaction amount'.
  2. Also implements a 'RaisedButton' that (as of now) prints the entered values when 'onPressed' is called/triggered.
Note: As of now, hard coded values has been added to the list, which will be replaced by the actual 'Transaction' added by the user.
*/
class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
            RaisedButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.blue.shade500),
              ),
              highlightColor: Colors.pink[100],
              //TODO: implement actual functionality i.e. adding the TextFiled values to the List of transactions.
              onPressed: () {
                print(titleController.text);
                print(amountController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
