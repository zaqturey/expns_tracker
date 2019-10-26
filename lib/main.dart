import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expns Tracker',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.orangeAccent,
        fontFamily: 'OpenSans',
        // adding a 'title' specific 'textTheme' that can be used across the entire app for title texts
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _populateTransactions = [];

  void _addNewTransaction(String txnTitle, double txnAmount) {
    final newTxn = Transaction(id: DateTime.now().toString(), title: txnTitle, amount: txnAmount, date: DateTime.now());

    setState(() {
      _populateTransactions.add(newTxn);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  // Getter method that (using the '_populateTransactions') returns a list of 'Transaction' that not older than seven days
  List<Transaction> get _recentTransactions {
    return _populateTransactions.where((txn) {
      return txn.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Expns Tracker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  color: Colors.blue,
                  child: Text("chart"),
                ),
              ),
              TransactionList(_populateTransactions),
              // PopulateTransactions(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
