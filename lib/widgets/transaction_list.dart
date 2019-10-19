import 'package:expns_tracker/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

/*
Class Objective:
  1. Constructor of this class i.e. 'TransactionList' accepts a List of <Transaction> and returns a
  2. 'Container' widget that in-turn contains a 'ListView' which
  iterate through each item in the List and then Renders its content using 'TransactionItem'
*/

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    // TODO: Use ListView Builder to avoid 'RenderFlex overflowed' error
    return Container(
      // 'double.maxFinite' will allow to take the max available height to the Container
      height: double.maxFinite,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return TransactionItem(
            txnTitle: transactions[index].title,
            txnAmount: transactions[index].amount,
            txnDate: transactions[index].date,
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
