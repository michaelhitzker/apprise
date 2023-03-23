import 'package:dad_jokes/style/spacings.dart';
import 'package:flutter/cupertino.dart';

class LoadingDialog extends StatelessWidget {
  final String? title;
  const LoadingDialog({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return CupertinoAlertDialog(
      title: title != null ? titleWidget(title) : const SizedBox(height: 0),
    );
  }

  Widget titleWidget(String title) {
    return Column(
      children: [
        Text(title),
        const SizedBox(height: SGSpacings.large),
      ],
    );
  }
}
