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

>> Adaptive UI implementation for 'Switch' widget and applied a Platform specific check for FAB
----------------------------------------------------------------------------------------------------------------------------------
Added
****************************
1. main.dart -> 
- Changed 'Switch' to 'Switch.adaptive', so the widget render as per the platform i.e. iOS or Android.
- Also applied Theme's accentColor as 'activeColor' to the Switch widget.
- FAB will not be rendered if Platform is iOS, instead an empty container will be displayed.  


>> Displaying 'Switch' widget depending on the device orientation, and corresponding refactoring.
----------------------------------------------------------------------------------------------------------------------------------
Refactoring
****************************
1. main.dart ->
- Moved the 'Container' that renders the 'Chart' widget into a new variabe i.e. 'txnChartWidget'
- Moved the 'Container' that renders the 'TransactionList' widget into a new variabe i.e. 'txnListWidget'

Added
****************************
1. main.dart ->
- Added a Bool variable i.e. 'isLandscape' to keep to check if device is in Landscape mode or not (using mediaQuery)
- Added a Bool variable i.e. '_showChart', that will be used whether the 'txnChartWidget' shud be displayed or not (depending on the value of 'isLandscape')
- Row containing the 'Switch' for '_showChart' will only be displayed for Landscape mode only.
- In case of 'Landscape', only one widget will be displayed i.e. 'txnChartWidget' OR 'txnListWidget' (using '_showChart')
- In case of 'Portrait', both 'txnChartWidget' AND 'txnListWidget' will be displayed.
- In 'txnChartWidget', height for 'Chart' widget will be calculated dynamically depending on the device Orientation. 


>> Displaying different 'trailing' icons depending on the device orientation
----------------------------------------------------------------------------------------------------------------------------------
Added
****************************
1. transaction_listtile.dart ->
- for trailing Icon, checking the device orientation using 'MediaQuery' and displaying 'FlatButton.icon' with 'Label' in case of 'Landscape' otherwise only the 'IconButton'.


>> Fixed - ModalBottomSheet visibility Issue when Soft keyboard is displayed
----------------------------------------------------------------------------------------------------------------------------------
Added
****************************
1. new_transaction.dart ->
- Wrapped the root 'Card' widget in a 'SingleChildScrollView'.
- For Bottom padding >> Added the addtional padding for the 'space required by soft keyboard' by using 'MediaQuery'


>> Changed default height for 'chart' widget, Added LayoutBuilder that returns the container that holds the 'No Txn available' image
----------------------------------------------------------------------------------------------------------------------------------
Added
****************************
1. Main.dart ->
- Changed default height for 'chart' widget from 30% to 70% (this is because now we display one widget at a time)  
2. transaction_list.dart ->  
- Place the 'Column' widget (that holds the image) inside a 'LayoutBuilder' , so image height can be assigned dynamically.  


>> Introducing 'Switch' widget to toggle between 'Chart' Widget and 'ListView' widget
----------------------------------------------------------------------------------------------------------------------------------
Added
****************************
1. Main.dart ->
- Added a new 'bool' in the '_HomeState' class i.e. '_showChart' and initialized it with 'false'
- Added a new 'Row' that contains a Text("Show Chart") and a 'Switch' widget.
- Switch has a default value of '_HomeState' i.e. false.
- The 'onChanged' of 'Switch', take the new value, calls the 'SetState' which in-turn calls the '_showChart' ternary expression.
-_showChart' (if true) will display the 'Chart' widget, otherwise the 'TransactionList' widget.

Removed
****************************
- Usage of 'SystemChrome.setPreferredOrientations' for only portrait orientation.


>> Disable 'LandScape' orientation at App level
----------------------------------------------------------------------------------------------------------------------------------
(Imp:  SystemChrome.setPreferredOrientations, DeviceOrientation.portraitUp, DeviceOrientation.portraitDown)
Updated:  
****************************
1. Main.dart ->
- Added a new method call inside the Main() method i.e. 'SystemChrome.setPreferredOrientations'
- To disable 'landscape orientation', also set its DeviceOrientation values to 'portraitUp' and' portraitDown' 


>> Introducing 'LayoutBuilder' - These are helpful in applying 'Constraints' to the SubWidgets
----------------------------------------------------------------------------------------------------------------------------------
Updated:  
****************************  
1. chart_bar.dart ->  
- Now the 'ChartBar' returns a LayoutBuilder, which in-turn will return a 'Column' widget  
- Assigned dynamically calculated height to the subwidgets of 'Column' widget i.e. depending on the 'Constraints' height.  


>> StatusBar Height: Removed/Subtracted 'StatusBar' height while performing dynamic height calculation using MediaQuery
----------------------------------------------------------------------------------------------------------------------------------
Updated:  
****************************
 1. main.dart ->
- Fetched 'StatusBar' height and assigned it to a final variable i.e. 'statusBarHeight' 
- Also assigned 'appBar' height to a final variable i.e. 'appBarHeight'
- Chart's Container height calculation -> Subtracted 'appBar' and 'StatusBar' height from the Screen height then assigned (40% of it) to the 'Container'.
- TransactionList's Container height calculation - > Subtracted 'appBar' and 'StatusBar' height from the Screen height then assigned (40% of it) to the 'Container'.
- Also removed the 'SafeArea' Widget to avoid any type for scrolling.


>> AppBar Height: Removed/Subtracted 'AppBar' height while performing dynamic height calculation using its 'preferredSize' property'
----------------------------------------------------------------------------------------------------------------------------------
Updated:  
****************************
1. main.dart ->
- Wrapped 'Chart' widget in a 'Container'
- Fetched Screen Height using 'MediaQuery', deducted 'appbar' height from it and then assigned (40%) to the 'Container'.
- Wrapped 'Chart' widget in a 'Container'
- Fetched Screen Height using 'MediaQuery', deducted 'appbar' height from it and then assigned (60%) to the 'Container'.
Refactored:  
****************************
2. chart.dart ->
- Removed root 'Container' widget and now it only returns a 'Card' (as height for this is taken care in the 'main.dart' )
3. transaction_list.dart ->
- Removed root 'Container' widget and now it only returns the output from the ternary expression i.e. either a 'Column' 
or a 'ListView.builder' (as height for the outcome widget is taken care in the 'main.dart' )


>> MediaQuery: Retrieved screen height dynamically and assigned it % to the widgets. 
----------------------------------------------------------------------------------------------------------------------------------
Added:  
****************************  
1. chart.dart ->  
- Wrapped the root 'Card' widget in a 'Container'.  
- Dynamically calculated the Screen Height using 'MediaQuery' and assigned (40%) to the root 'Container'.  
2. transaction_list.dart ->  
- Dynamically calculated the Screen Height using 'MediaQuery' and assigned (60%) to the root 'Container'.  


>> Added a Trailing 'trailing: IconButton' in 'transaction_listtile.dart', and a '_deleteTransaction()' method in the 'main.dart'  
----------------------------------------------------------------------------------------------------------------------------------
Added:  
****************************
1. transaction_listtile.dart ->  
- A 'trailing: IconButton' has been added to the 'ListTile'  
- Two new variables has been added to the class i.e. 'String txnId' and 'Function deleteTxn'  
- Constructor 'TransactionListtile' now takes two more '@required' parameters and assign those to the newly added parameters i.e. 'this.txnId' and 'this.deleteTxn'    
- 'onPressed' property of IconButton' of the 'ListTile' now refers to an 'anonymous' function that calls the 'deleteTxn(txnId)' function. 
2. transaction_list.dart ->  
- Now 'TransactionList' constructor accepts a new parameter i.e. 'deleteTxn' (this is Function parameter)  
- Two new parameters will be passed into the 'TransactionListtile' widget i.e. 'txnId' and 'deleteTxn'  
(Note: These parameters will be required by the 'TransactionListtile' widget to delete a given transaction)  
3. main.dart ->  
- '_deleteTransaction(String id)' -> A new method has been added that will delete a Transaction (inside the 'setState') from the '_populateTransactions' list, depending on the the txn 'id' parameter.   
- 'TransactionList' -> now this widget passes an additional argument i.e. '_deleteTransaction'  


>> Now 'addTxn' will use the user selected date (from datePicker) instead of default current date.  
----------------------------------------------------------------------------------------------------------------------------------
Added:  
****************************  
1. new_transaction.dart ->  
-  '_submitData()' -> Added an NULL check for '_selectedTransactionDate'  
- 'widget.addTxn' -> now it accepts a new argument i.e. '_selectedTransactionDate'  
2. main.dart ->  
- '_addNewTransaction' -> now this method accepts a new parameter i.e. 'chosenTxnDate' and uses it for 'date' field instead of using the default 'DateTime.now()'  


>> DatePicker Implementation - Continued
----------------------------------------------------------------------------------------------------------------------------------
Added:  
****************************
1. new_transaction.dart ->
- a new 'DateTime' variable i.e. '_selectedTransactionDate' is added that will store the user selected date.
- a new '_displayDatePicker' method has been added, that will be render the 'Calender' (using the inbuilt 'showDatePicker' widget)
- '_displayDatePicker' calls a 'Future' i.e. once the user has selected a Date, it call a 'SetState()' function and inside that it assigns the 'chosenDate' to '_selectedTransactionDate'
- 'onPressed' function for 'Choose Date' FlatButton i snow referring to _displayDatePicker'
- If the user has selected a Date, 'TextField' now displays the user selected date instead of '# No Date Chosen!' text.


>> Refactored 'new_transaction.dart' i.e. appended underscore '_' in front of private variables and functions i.e. 'titleController', 'amountController' and 'submitData'
----------------------------------------------------------------------------------------------------------------------------------


>> Started DatePicker Implementation in 'NewTransaction' widget 
----------------------------------------------------------------------------------------------------------------------------------
Added:
****************************
1. new_transaction.dart -> a new 'Row' (inside a Container) has been added, that renders a 'Text' and  a 'FlatButton' widget
2. main.dart -> Added new 'TextStyle' for 'button' widget in the 'ThemeData', so it can be used Globally.
3. new_transaction.dart -> Applied the newly added button color to 'RaisedButton'


>> Refactoring for 'FittedBox' to always get a fixed height and reversed the List contents for 'groupedTransactionValues'
----------------------------------------------------------------------------------------------------------------------------------
Refactored:
****************************
1. chart_bar.dart -> Placed 'FittedBox' (dailySpendingAmount) in a 'Container' (with a Fixed height) so it wouldn't shrink, and hence not displacing the position of other widgets.
2. chart.dart -> Reversed the contents of generated List i.e. 'groupedTransactionValues', so the current Day Transaction is rendered at last 


>> Implemented 'ListTile', now 'ListView.builder' of 'TransactionList' calls to 'TransactionListtile' instead of 'TransactionItem'
----------------------------------------------------------------------------------------------------------------------------------
Added:  
****************************
1. Added a new 'TransactionListtile' widget (i.e. a new 'transaction_listtile.dart' file)  
- it implements a 'Named' constructor that accepts theree parameters required fos a single transaction i.e. 'txnTitle', 'txnAmount' and 'txnDate'  
- 'TransactionListtile' returns a card widget that wraps a 'ListTile' which renders the passed in parameters for a single Transaction.  

Refactored:  
****************************
1. transaction_list.dart -> implementation for 'ListView.builder' has been refactored to to 'TransactionListtile' instead of 'TransactionItem'  

Deleted:  
****************************
1. transaction_item.dart -> As we going to use the ListTile to display the items in 'ListView.builder', hence deleted this file ('TransactionItem' widget)  


>> Implemented 'ChartBar' widget and refactored 'chart.dart' to use it  
   (Highlights - 'fold()' function on List, 'FractionallySizedBox', 'Color.fromRGBO', 'Stack', 'FittedBox', 'BoxDecoration', 'Flexible' with FlexFit)  
   (Note: As per the planned design, the 'chart' widget will render seven 'chart_bar' widget i.e. one 'chart_bar' for each Weekday.)  
   (Note: a 'chart_bar' will render three pieces of information for a Single Day i.e. A). WeekDay Initial Letter, B). Amount Spent, c). daily spending % of The Week)  
1. chart_bar.dart >> a new widget file is added, that will display a single BAR for a WeekDay in the Chart widget i.e.  
   - it implements a 'Named' constructor that accepts three parameters to be rendered on UI.  
2. chart.dart >> a lot has been refactored to use the 'chart_bar' widget instead of just displaying the text values only i.e.  
   - a new getter 'totalWeeklySpending' has been implemented, that returns the sum total of the daily transactions for the given week.  
   - Row widget inside the Card widget has been updated to use the 'ChartBar' widget.  


>> Started working on 'chart' widget. Highlights - for loop flavors, 'substring()', 'DateTime.now().subtract(Duration(days: index)' 
1. chart.dart >> following has been implemented so far:  
1.1. Implements a constructor that accepts 'recentTransactions'   
     (will be passed from the instance of 'chart' widget from main.dart)  
1.2. Added a 'getter' method i.e. 'groupedTransactionValues' that returns a List of 7 Map items that contains:  
     A) Week 'day' for Transaction and B) sum total for all transactions for that given day.  
     It returns a 'card' widget, that contains a 'Row', wherein we iterate though all the  
     contents/transactions in 'groupedTransactionValues' and rendering 'day' and 'amount' values for each txn.  
2. main.dart >> following has been implemented so far:  
2.1. Replaced 'Container' widget with 'Chart' widget.  
2.2. Passing in '_recentTransactions' as an argument to the 'Chart' widget.  


>> Added a new getter method i.e. '_recentTransactions' that returns a list of 'Transaction' that not older than seven days
- main.dart >> a new getter method i.e. '_recentTransactions' is added that (using the '_populateTransactions')  
-- returns a list of 'Transaction' that not older than seven days


>> Added 'assets/images' folder, added a new image, added logic to display it if there is no data in 'transactions' List.   
- assets/images >> added a new folder i.e. 'images' for local picture storage  
- assets/images >> added a new 'no_txn_available.png' images  
- pubspec.yaml >> Added/Uncommented 'assets' section and added relative path for the 'no_txn_available.png'  
- transaction_list.dart >> Applied 'ternary-operator' to display 'no_txn_available.png' in case no data is available.  


>> Added 'assets/fonts' folder and added a new font family to it. Also added a generic text style for 'title' and applied it.
- assets >> added a new folder i.e. 'assets' at root level.
- assets/fonts >> added a new folder i.e. 'fonts' to store different font files
- assets/fonts/open-sans >> Downloaded a new font from 'fonts.google.com', extracted it ttf files and stored in this folder
- pubspec.yaml >> Added/Uncommented 'fonts' section and added different variants for 'OpenSans' and 'Quicksand' 
- main.dart >> updated 'theme' i.e added 'Quicksand' as 'fontfamily' to 'ThemeData'
- main.dart >> added a 'title' specific 'textTheme' that can be used across the entire app for title texts
- 'transaction_item.dart' >>  for 'txnTitle' replaced the custom 'style' properties with   
-- the 'style' properties provided by 'title' property of 'textTheme' property of 'ThemeData' 
  

>> Implemented 'theme' for the app, and applied it theme to the Widgets using 'BuildContext'
- 'new_transaction.dart' >> theme widget has been added and used 'primarySwatch' and 'accentColor' properties.  
- 'transaction_item.dart' >>  Applied theme to Text widget displaying the 'txnAmount'

>> Refactored 'new_transaction.dart' to avoid data getting lost while switching between 'TextEditingController's  
- 'new_transaction.dart' >> NewTransaction now extends a stfull widget instead of a stless widget.  

>> Refactored 'new_transaction.dart' to avoid data getting lost while switching between 'TextEditingController's  
- 'new_transaction.dart' >> NewTransaction now extends a stfull widget instead of a stless widget.   
- Variable 'addTxn' Declaration is kept in the 'Widget class' (as the class constructor is also defined here) 
-- and not in the 'state' class, so that class object can accepts the passed in 'Function Variable'
-- Call to actual 'addTxn' function is done using the 'Widget' property, that allow to access data of 'Widget Class'  
-- inside the 'State Class'.

>> Cleared 'TextEditingController's after addTxn is called  
- new_transaction.dart >> Cleared 'titleController' and 'amountController' after addTxn is called.  

>> Added 'IconButton' and 'FloatingActionButton'  
- main.dart >> New 'IconButton' has been added in the AppBar.  
- main.dart >> New 'FloatingActionButton' has been added in the Scaffold area.  


>> Refactoring - Bug Fix for 'onSubmitted' and used 'toStringAsFixed' to display data till 2 decimal places. 
- new_transaction.dart >> Refactored > Following has been fixed i.e.  
-- 1. For 'onSubmitted' to work, the corresponding function must be called and not just the function reference i.e.
-- it should be 'onSubmitted: (_) => submitData()' and not 'onSubmitted: (_) => submitData'
-- This is because, we are calling an anonymous function and inside that we must call the function and not reference.
- transaction_item.dart >> applied ''toStringAsFixed' on 'txnAmount' to display data till 2 decimal places.


>> Implemented 'keyboardType', 'onSubmitted' for TextFields, Added 'submitData' as a generic function.
- new_transaction.dart >> Refactored > Following has been implemented i.e.
-- 1. Added 'keyboardType' and 'onSubmitted' for TextFields
-- 2. Moved 'addTxn()' to a separate function i.e. 'submitData', so  that it can be called from 'onSubmitted' as well.
-- 3. Updated implementation of 'addTxn()' i.e now it uses values from 'TextControllers' rather directly using them.
-- 3. Now 'submitData' is called from 'onPressed' and 'onSubmitted'.
-- 4. a validation check for invalid/incorrect values has been added in the 'submitData' function.


>> Implemented 'setState()', 'ListView.builder', SingleChildScrollView, 'double.maxFinite' 
- populate_transactions.dart >> Refactored > Following has been implemented i.e.
-- 1. 'PopulateTransactions' now extends a stfull widget instead of a stless widget.
-- 2. Now it returns a 'Container' widget renders two custom widget i.e. 
--- 'NewTransaction(_addNewTransaction)' and 'TransactionList(_populateTransactions)'
-- 3. A new function i.e. '_addNewTransaction()' which adds a new Transaction Object to the List and call 'setState()'
- main.dart >>  Refactored > Now implements a SingleChildScrollView.
- main.dart >> a new 'Container' show 'chart' text has been added.
- transaction_list.dart >> Refactored > Now 'Container' can take all the remaining height.


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
