import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/chart.dart';
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

  // Bool variable '_showChart' to store the value from 'Switch' widget, initializing as 'false'
  bool _showChart = false;

  @override
  Widget build(BuildContext context) {
    // Creating and instance of 'MediaQuery', so we don't need to instantiate it multiple times/places
    final mediaQuery = MediaQuery.of(context);

    // Checking if device is in Landscape mode or not and then assigning it to a bool i.e. 'isLandscape'
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    // Moved 'appBar' initialization into a variable, so can get its height using 'pre.h'
    // Explicitly defining the Type for 'appBar' as Dart is unable to infer its type after using the
    // 'CupertinoNavigationBar' and hence unable to call 'preferredSize.height' on appBar
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            // Setting the 'AppBar' title using CupertinoNavigationBar's  'middle' property
            middle: Text('Expns Tracker'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context),
                )
              ],
            ),
          )
        : AppBar(
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
    final double statusBarHeight = mediaQuery.padding.top;

    // Fetching the height of 'AppBar' using its 'preferredSize' property
    final double appBarHeight = appBar.preferredSize.height;

    final txnChartWidget = Container(
      height: isLandscape
          ? (mediaQuery.size.height - appBarHeight - statusBarHeight) * 0.7
          : (mediaQuery.size.height - appBarHeight - statusBarHeight) * 0.3,
      child: Chart(_recentTransactions),
    );

    final txnListWidget = Container(
      height: (mediaQuery.size.height - appBarHeight - statusBarHeight) * 0.7,
      child: TransactionList(_populateTransactions, _deleteTransaction),
    );

    // Moved 'body' widget initialization into a variable,
    // Also wrapped, 'SingleChildScrollView' widget in a 'SafeArea' widget to avoid 'Notch' area overlapping
    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Render the below 'Row' widget only if the device is in Landscape mode
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Adding 'style' widget to use 'textTheme.title' so it remain same while rendering on iOS
                  Text(
                    "Show Chart",
                    style: Theme.of(context).textTheme.title,
                  ),
                  Switch.adaptive(
                    activeColor: Theme.of(context).accentColor,
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  ),
                ],
              ),
            if (isLandscape)
              _showChart ? txnChartWidget : txnListWidget,
            if (!isLandscape)
              Column(
                children: <Widget>[
                  txnChartWidget,
                  txnListWidget,
                ],
              )
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: pageBody,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
          );
  }
}
