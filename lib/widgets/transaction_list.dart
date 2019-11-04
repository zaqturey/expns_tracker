import 'package:expns_tracker/models/transaction.dart';
import 'package:expns_tracker/widgets/transaction_listtile.dart';
import 'package:flutter/material.dart';

/*
Class Objective:
  1. Constructor of this class i.e. 'TransactionList' accepts a List of <Transaction> and returns a
  2. 'Container' widget that in-turn checks if 'No Data' is available in the 'transactions' List:
  2.1. Renders an image, otherwise
  2.2. Iterate through each item in the List and Render its content using 'TransactionItem'
*/

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTxn;

  TransactionList(this.transactions, this.deleteTxn);

  @override
  Widget build(BuildContext context) {
    // TODO: Use ListView Builder to avoid 'RenderFlex overflowed' error
    return Container(
      // 'double.maxFinite' will allow to take the max available height to the Container
      height: double.maxFinite,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transaction is added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 10),
                Image.asset('assets/images/no_txn_available.png'),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionListtile(
                  txnId: transactions[index].id,
                  txnTitle: transactions[index].title,
                  txnAmount: transactions[index].amount,
                  txnDate: transactions[index].date,
                  deleteTxn: deleteTxn,
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
