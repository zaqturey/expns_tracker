import 'package:expns_tracker/models/transaction.dart';
import 'package:expns_tracker/widgets/chart_bar.dart';
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
      var totalDailySpending = 0.0;

      // Iterating through each Transaction in 'recentTransactions' where "Transaction Day = weekday"
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          // summing up all the matching Transaction amount for the matching day
          totalDailySpending += recentTransactions[i].amount;
        }
      }

      return {
        // Below for 'day', we are only returning the first Letter of the week
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalDailySpending,
      };
    });
  }

  // getter 'totalWeeklySpending' will return the sum of total spending for all the seven days i.e. sum of all 'amount'
  double get totalWeeklySpending {
    // calling 'fold' function on a list allow the list to be converted to an other type
    // as we need sum of all the 'amount' ('totalDailySpending') in the 'groupedTransactionValues', we are using 'fold'
    return groupedTransactionValues.fold(0.0, (sum, listItem) {
      return sum + listItem['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((txnData) {
            // wrapping the 'ChartBar' in a 'Flexible', so the contents will only render in the assigned space.
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                weekLabel: txnData['day'],
                dailySpendingAmount: txnData['amount'],
                spendingPctOfTotal:
                    totalWeeklySpending == 0.0 ? 0.0 : (txnData['amount'] as double) / totalWeeklySpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
