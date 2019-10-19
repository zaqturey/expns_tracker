import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

/*
Class Objective:
  1. Provide/return a 'Container' widget renders two custom widgets i.e.
  1.1. NewTransaction - this renders a 'Card' widget that facilitates user to add a new Transaction.
  1.2  TransactionList - this renders a ListView Builder that displays all the Transactions in the List
  2. Implement a new method e.g. '_addNewTransaction' that performs the following i.e.
  2.1. create a new object of 'Transaction' class
  2.2. Add that 'Transaction' object to the '_populateTransactions' List
  2.3 Call the 'setState()' method, so that, updated '_populateTransactions' List gets rendered on the UI.
*/
class PopulateTransactions extends StatefulWidget {
  @override
  _PopulateTransactionsState createState() => _PopulateTransactionsState();
}

class _PopulateTransactionsState extends State<PopulateTransactions> {
  // Creating a List of Transaction type
  final List<Transaction> _populateTransactions = [];

  void _addNewTransaction(String txnTitle, double txnAmount) {
    final newTxn = Transaction(id: DateTime.now().toString(), title: txnTitle, amount: txnAmount, date: DateTime.now());

    setState(() {
      _populateTransactions.add(newTxn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Creating Object of 'NewTransaction' and passing the Address of '_addNewTransaction' as argument
        NewTransaction(_addNewTransaction),
        TransactionList(_populateTransactions),
      ],
    );
  }
}
