import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/*
Class Objective:
  1. Constructor of this class i.e. 'TransactionItem' accepts three parameters and returns a 'Card' widget
  2. The 'Card' widget Renders the contents for that Transaction.
*/

class TransactionItem extends StatelessWidget {
  final String txnTitle;
  final double txnAmount;
  final DateTime txnDate;

  TransactionItem({@required this.txnTitle, @required this.txnAmount, @required this.txnDate});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              // Displaying Amount for on 2 decimal places
              '\$${txnAmount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                txnTitle,
                style: Theme
                    .of(context)
                    .textTheme
                    .title,
              ),
              Text(
                DateFormat.yMMMd().format(txnDate),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
