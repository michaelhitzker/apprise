import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TwoActionDialog extends StatelessWidget {
  final String title;
  final String message;
  final String yesText;
  final String noText;
  final VoidCallback? onYesPressed;
  final VoidCallback? onNoPressed;

  const TwoActionDialog(
      {super.key,
      required this.title,
      required this.message,
      required this.yesText,
      required this.noText,
      this.onYesPressed,
      this.onNoPressed});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primarySwatch: Colors.blue),
      child: CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: onYesPressed,
            isDefaultAction: true,
            child: Text(yesText),
          ),
          CupertinoDialogAction(
            onPressed: onNoPressed,
            child: Text(noText),
          ),
        ],
      ),
    );
  }
}
