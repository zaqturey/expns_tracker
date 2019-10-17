import 'package:flutter/foundation.dart';

// Below class implements a model/blueprint for a single Transaction
class Transaction {
  // Declaring below variables as 'final' as these are run-time constants
  String id;
  String title;
  double amount;
  DateTime date;

  // As all below parameters mandatory to create an object of 'Transaction' class,
  // hence adding '@required' decorator/annotation for each parameter.
  // '@required' is implemented in flutter and is not a dart's built in decorator.
  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}
