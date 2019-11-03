import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  DateTime _selectedTransactionDate;

  // '_submitData' will get data from _startAddNewTransaction('showModalBottomSheet') and
  // using 'Widget' (which works as a bridge between 'NewTransaction' and '_NewTransactionState' class)
  // will call 'widget.addTxn' to add a
  void _submitData() {
    // Fetching the values from the controllers
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    // Checking that correct values are present in the input Fields, else exit without performing 'addTxn'
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedTransactionDate == null) {
      return;
    }
    widget.addTxn(enteredTitle, enteredAmount, _selectedTransactionDate);
    // Clearing the 'titleController' and 'amountController' once 'addTxn' is called
    _titleController.clear();
    _amountController.clear();

    // Closing the top most window i.e. 'showModalBottomSheet' in this case.
    Navigator.of(context).pop();
  }

  // Below method will render the 'DatePicker' and using the FUTURE method i.e. 'then()', assign the chosen date to
  void _displayDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((chosenDate) {
      if (chosenDate == null) {
        return;
      }
      setState(() {
        _selectedTransactionDate = chosenDate;
      });
    });
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
                  Expanded(
                    child: Text(_selectedTransactionDate == null
                        ? '# No Date Chosen!'
                        : 'Picked Date:- ${DateFormat.yMMMd().format(_selectedTransactionDate)}'),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _displayDatePicker,
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
