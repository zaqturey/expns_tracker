import 'package:flutter/material.dart';

// This class/widget will provide the rendering layout and data for a single day transaction in the chart widget
class ChartBar extends StatelessWidget {
  final String weekLabel;
  final double dailySpendingAmount;
  final double spendingPctOfTotal;

  // Building a 'Mandatory' and 'Named' constructor
  ChartBar({@required this.weekLabel, @required this.dailySpendingAmount, @required this.spendingPctOfTotal});

  @override
  Widget build(BuildContext context) {
    // Now the 'ChartBar' returns a LayoutBuilder, which in-turn will return a 'Column' widget
    // A 'LayoutBuilder' gives the 'Constraints' info about the Widget it is inside i.e. 'ChartBar' in this case.
    // Now using LayoutBuilder's 'constraints', we can apply the 'Constraints' to the widgets inside the column widget.
    // Note: 'Constraints' is an object that contains the information about the 'Constraints' that may apply
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            // Placing the 'FittedBox' in a 'Container' (with a Fixed height) so it wouldn't shrink
            Container(
              height: constraints.maxHeight * 0.15,
              // Placing the 'dailySpendingAmount' in a 'FittedBox' so it will shrink fit its content, rather than linebreak
              child: FittedBox(
                child: Text('\$${dailySpendingAmount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              height: constraints.maxHeight * 0.60,
              width: 10,
              child: Stack(
                children: <Widget>[
                  // Below widget/container will be laid out at the Bottom of the Stack widget
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    // As we cant set the 'decoration' for a 'FractionallySizedBox',
                    // hence adding 'Container' and then setting the 'decoration' properties to that
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              height: constraints.maxHeight * 0.15,
              // Wrapping 'Text' in a 'FittedBox', the text will automatically resize acc. to the device size.
              child: FittedBox(
                child: Text(weekLabel),
              ),
            ),
          ],
        );
      },
    );
  }
}
