import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String buttonText;
  final Function buttonHandler;

  AdaptiveFlatButton({@required this.buttonText, @required this.buttonHandler});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              buttonText,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: buttonHandler,
          )
        : FlatButton(
            child: Text(
              buttonText,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: buttonHandler,
          );
  }
}
