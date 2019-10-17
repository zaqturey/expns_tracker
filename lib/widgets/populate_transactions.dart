import 'package:expns_tracker/models/transaction.dart';
import 'package:expns_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

/*
Class Objective:
  1. Provide/return a 'Container' widget that has List of all transactions added by the User.
  2. It does so by creating/implementing an object of 'TransactionList' (and passing the 'List<Transaction>' as an argument to it)
Note: As of now, hard coded values has been added to the list, which will be replaced by the actual 'Transaction' added by the user.
*/
class PopulateTransactions extends StatelessWidget {
  // TODO: remove the hard coded values from the List
  // Creating a List of Transaction type
  final List<Transaction> _populateTransactions = [
    Transaction(id: 't1', title: 'Buy Dinner', amount: 152.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Office Shirts', amount: 279.00, date: DateTime.now()),
    Transaction(id: 't3', title: 'Iphone 11', amount: 1099.00, date: DateTime.now()),
    Transaction(id: 't4', title: 'TFL', amount: 329.29, date: DateTime.now()),
    Transaction(id: 't5', title: 'Air India', amount: 2158.55, date: DateTime.now()),
    Transaction(id: 't6', title: 'Buy Dinner', amount: 152.99, date: DateTime.now()),
    Transaction(id: 't7', title: 'Office Shirts', amount: 279.00, date: DateTime.now()),
    Transaction(id: 't8', title: 'Iphone 11', amount: 1099.00, date: DateTime.now()),
    Transaction(id: 't9', title: 'TFL', amount: 329.29, date: DateTime.now()),
    Transaction(id: 't10', title: 'Air India', amount: 2158.55, date: DateTime.now()),
  ];

  // TODO: Implement a new function that add Transaction to the '_populateTransactions'

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TransactionList(transactions: _populateTransactions),
    );
  }
}
