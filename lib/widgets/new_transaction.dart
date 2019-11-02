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
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _submitData() {
    // Fetching the values from the controllers
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    // Checking that correct values are present in the TextFields, else exit without performing 'addTxn'
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTxn(enteredTitle, enteredAmount);
    // Clearing the 'titleController' and 'amountController' once 'addTxn' is called
    _titleController.clear();
    _amountController.clear();

    // Closing the top most window i.e. 'showModalBottomSheet' in this case.
    Navigator.of(context).pop();
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
              controller: _titleController,
              // When calling 'onSubmitted', we need to pass the Final/Changed value to the called/anonymous Function
              // e.g. 'submitData', but since we will not be using that value, we can use an '_', which means though
              // 'submitData' accepts a 'String' parameter, but we wouldn't be using it.
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: _amountController,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text('# No Date Chosen!'),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Chhose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // TODO: implement the functionality to show the DatePicker
                    onPressed: () {},
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
