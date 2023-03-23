import 'package:flutter/material.dart';

extension ButtonStyleButtonExtensions on ButtonStyleButton {
  Widget noFeedbackButton() {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: IgnorePointer(
        child: this,
      ),
    );
  }
}
