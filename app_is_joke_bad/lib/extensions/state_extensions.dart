import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension StatelessExtensions on StatelessWidget {
  TextTheme get textTheme {
    return theme.textTheme;
  }

  ThemeData get theme {
    final context = Get.context!;
    return Theme.of(context);
  }
}

extension StateExtensions on State {
  TextTheme get textTheme {
    return theme.textTheme;
  }

  ThemeData get theme {
    return Theme.of(context);
  }

  Future<void> showGeneralErrorAlert(
      {required String title, required String message}) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: ThemeData(primarySwatch: Colors.blue),
          child: CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                child: const Text("Ok"),
                onPressed: () => Get.back(),
              ),
            ],
          ),
        );
      },
    );
  }
}
