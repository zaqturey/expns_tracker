import 'package:flutter/material.dart';

/*
Class Objective:
  1. Provide/return a 'Card' widget that allow user to input 'transaction amount' and 'transaction amount'.
  2. Also implements a 'RaisedButton' that (as of now) prints the entered values when 'onPressed' is called/triggered.

*/
class NewTransaction extends StatefulWidget {
  final Function addTxn;

  NewTransaction(this.addTxn);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    // Fetching the values from the controllers
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    // Checking that correct values are present in the TextFields, else exit without performing 'addTxn'
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTxn(enteredTitle, enteredAmount);
    // Clearing the 'titleController' and 'amountController' once 'addTxn' is called
    titleController.clear();
    amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              keyboardType: TextInputType.text,
              controller: titleController,
              // When calling 'onSubmitted', we need to pass the Final/Changed value to the called/anonymous Function
              // e.g. 'submitData', but since we will not be using that value, we can use an '_', which means though
              // 'submitData' accepts a 'String' parameter, but we wouldn't be using it.
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            RaisedButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.blue.shade500),
              ),
              highlightColor: Colors.pink[100],
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
