import 'package:expns_tracker/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

/*
Class Objective:
  1. Constructor of this class i.e. 'TransactionList' accepts a List of <Transaction> and returns a 'ListView' widget
  2. The 'ListView' iterate through each item in the List and then Renders its content using 'TransactionItem'
*/

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({@required this.transactions});

  @override
  Widget build(BuildContext context) {
    // TODO: Use ListView Builder to avoid 'RenderFlex overflowed' error
    return Expanded(
      child: ListView(
        children: transactions.map((txn) {
          return TransactionItem(
            txnTitle: txn.title,
            txnAmount: txn.amount,
            txnDate: txn.date,
          );
        }).toList(),
      ),
    );
  }
}
