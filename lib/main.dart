import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './models/transaction.dart';
import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  // Using 'setPreferredOrientations' to only allow the 'portraitUP' and 'portraitDown' orientations.
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(MyApp());
}

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
              // Adding Global Button theme
              button: TextStyle(color: Colors.white),
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

  void _addNewTransaction(String txnTitle, double txnAmount, DateTime chosenTxnDate) {
    final newTxn = Transaction(
      id: DateTime.now().toString(),
      title: txnTitle,
      amount: txnAmount,
      date: chosenTxnDate,
    );

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

  void _deleteTransaction(String id) {
    setState(() {
      return _populateTransactions.removeWhere((txn) => txn.id == id);
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
    // Moved 'AppBar' declaration into a variable, so can get its height using 'pre.h'
    final appBar = AppBar(
      backgroundColor: Colors.red,
      title: Text('Expns Tracker'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ],
    );

    // Fetching the height of 'StatusBar' using MediaQuery
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    // Fetching the height of 'AppBar' using its 'preferredSize' property
    final double appBarHeight = appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height - appBarHeight - statusBarHeight) * 0.3,
              child: Chart(_recentTransactions),
            ),
            // Note: Since 'IconButton' (delete) is rendered inside the '_populateTransactions',
            // and will be called from inside the '_populateTransactions', therefore, we must pass
            // '_deleteTransaction' as an argument to the 'TransactionList'
            Container(
              height: (MediaQuery.of(context).size.height - appBarHeight - statusBarHeight) * 0.7,
              child: TransactionList(_populateTransactions, _deleteTransaction),
            ),
            // PopulateTransactions(),
          ],
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
