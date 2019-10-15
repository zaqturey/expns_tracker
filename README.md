# expns_tracker
A new Flutter application for tracking your daily finances.

## Getting Started
This project is a starting point for a Flutter application.
A few resources to get you started if this is your first Flutter project:
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Commits History (newest on the top)

>> TextEditingController: Implemented 'TextEditingController' for 'title' and 'amount' instead of String variables.
(Note:  a TextEditingController gives you the final value once all the keystrokes are done instead on value of each keystroke.)
- main.dart >> Removed String variables i.e. 'titleInput' and 'amountInput'
- main.dart >> Added two TextEditingControllers i.e. 'titleController' and 'amountController'
- main.dart >> Removed 'onChange()' functions from the to respective TextField for 'title' and 'amount'
- main.dart >> Assigned the TextEditingControllers to respective TextField i.e. 'titleController' and 'amountController'
- main.dart >> Updated 'onPressed' function of 'RaisedButton' to use print text from 'titleController' and 'amountController'.


>> Initial Commit: Implemented 'Card' widget that has TextFields for 'Title' and 'Amount' and a 'RaisedButton'
- main.dart >> Scaffold has implementation for 'appbar' and 'body' widgets
- main.dart >> 'body' implements 'SafeArea' that implements a 'Container' that implements a 'Card' as a child.
- main.dart >> 'Card' widget implements TextFields for 'Title' and 'Amount' and a 'RaisedButton' for 'Add Transaction'.
- main.dart >> 'onChanged' func of 'Title' and 'Amount' TextFields, assign the updated valued to 'titleInput' and 'amountInput' String variables.
- main.dart >> 'onPressed' func of 'RaisedButton', prints the updated values of 'titleInput' and 'amountInput' String variables on Console.
