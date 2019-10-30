import 'package:expns_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Below widget will render the complete chart widget
class Chart extends StatelessWidget {
  // Below List will be used to store the the 'Transactions' for last seven days.
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  // getter 'groupedTransactionValues' will return a list of maps, that will used in the 'Card' widget
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      // Lets get the 'day' for which we are generating the 'Transaction values' depending on the index value
      final weekday = DateTime.now().subtract(Duration(days: index));
      var dailySum = 0.0;

      // Iterating through each Transaction in 'recentTransactions' where "Transaction Day = weekday"
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          // summing up all the matching Transaction amount for the matching day
          dailySum += recentTransactions[i].amount;
        }
      }

/*
//      recentTransactions.forEach((txn) => {
//            if (txn.date.day == weekday.day &&
//                txn.date.month == weekday.month &&
//                txn.date.year == weekday.year)
//              {dailySum += txn.amount},
//          });

//      for(var txn in recentTransactions) {
//        if (recentTransactions[i].date.day == weekday.day &&
//            recentTransactions[i].date.month == weekday.month &&
//            recentTransactions[i].date.year == weekday.year) {
//          // summing up all the matching Transaction amount for the matching day
//          dailySum += txn.amount;
//        }
//      }
 */

      return {
        // Below for 'day', we are only returning the first Letter of the week
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': dailySum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((txn) {
          return Text(' ${txn['day']}: ${txn['amount']}');
        }).toList(),
      ),
    );
  }
}
