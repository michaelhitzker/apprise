import 'package:flutter/material.dart';

class KeyboardDismissGestureDetector extends StatelessWidget {
  final Widget child;
  const KeyboardDismissGestureDetector({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
