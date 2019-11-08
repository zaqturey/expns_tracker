import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/*
Class Objective:
  1. Constructor of this class i.e. 'TransactionListtile' accepts three parameters and returns a 'ListTile' widget
  2. The 'ListTile' widget Renders the contents for the passed in Transaction.
*/

class TransactionListtile extends StatelessWidget {
  final String txnId;
  final String txnTitle;
  final double txnAmount;
  final DateTime txnDate;
  final Function deleteTxn;

  TransactionListtile(
      {@required this.txnId,
      @required this.txnTitle,
      @required this.txnAmount,
      @required this.txnDate,
      @required this.deleteTxn});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text('\$$txnAmount'),
            ),
          ),
        ),
        title: Text(
          '$txnTitle',
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(DateFormat.yMMMd().format(txnDate)),
        // Displaying different 'trailing' icons depending on the device orientation
        trailing: MediaQuery.of(context).orientation == Orientation.landscape
            ? FlatButton.icon(
                onPressed: () => deleteTxn(txnId),
                icon: Icon(Icons.delete),
                label: Text("Delete"),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                // default 'errorColor' is red, but if want a different color,
                // you can explicitly define in the 'ThemeData' of 'main.dart'
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTxn(txnId),
              ),
      ),
    );
  }
}
