import 'package:dad_jokes/extensions/state_extensions.dart';
import 'package:dad_jokes/style/spacings.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MainNavbar extends StatelessWidget {
  final VoidCallback? onRightItemPressed;
  const MainNavbar({super.key, this.onRightItemPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SGSpacings.large),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _leftItem,
            _title,
            _rightItems,
          ],
        ),
      ),
    );
  }

  Widget get _leftItem {
    return const SizedBox(
      height: 40,
      width: 40,
    );
  }

  Widget get _title {
    return Text(
      "This App is a Joke",
      style: textTheme.titleSmall,
    );
  }

  Widget get _rightItems {
    return SizedBox(
      height: 40,
      width: 40,
      child: IconButton(
          onPressed: () {
            final callback = onRightItemPressed;
            if (callback == null) {
              return;
            }
            callback();
          },
          icon: const Icon(LucideIcons.moreVertical)),
    );
  }
}
