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

>> Added separate widget i.e. 'PopulateTransactions()' to display the list of Transactions
- models >> New package > this package will contain the implementation for generic/custom classes  
- transaction.dart >> New file > It implements a model/blueprint for a single Transaction
- transaction_item.dart >> New file > Takes three parameters and return a 'Card' widget that Renders the contents for a single Transaction.
- transaction_list.dart >> New file > Takes 'List<Transaction>' as parameter and return an 'Expanded' widget that Renders a ListView.
- populate_transactions.dart >> New file > Provide/return a 'Container' widget that Renders 'TransactionList' (passing the List<Transaction> as argument to it. 
- main.dart >> Refactored >> Replaced the direct rendering of Widgets with 'NewTransaction()' and 'PopulateTransactions()' as children widget to the 'Column' widget.
Note: 'transaction_list.dart' >> wrapping the ListView in an 'Expanded' is not good solution as it may throw an 'RenderFlex overflowed' error upon rotation.


>> Added a new 'widgets' package (for separately managing the custom widgets)  
- main.dart >> removed the 'card widget' (along with its contents) specific to add a new transaction (moved to a separate file)
- new_transaction.dart >> a new file that extends a 'stless widget' and returns a "card widget" to add a new transaction.
- main.dart >> Now instead of the 'card widget', a function call i.e 'NewTransaction()' has been added.
- main.dart >> Refactor > Now Home class extends a 'stless' instead of 'stfull' widget as we are not setting/rebuilding any widget. 


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
