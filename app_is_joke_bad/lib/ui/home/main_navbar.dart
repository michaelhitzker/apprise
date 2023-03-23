import 'package:dad_jokes/extensions/state_extensions.dart';
import 'package:dad_jokes/style/spacings.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MainNavbar extends StatelessWidget {
  final VoidCallback? onSignoutPressed;
  final VoidCallback? onAboutPressed;
  final VoidCallback? onLeftItemPressed;
  const MainNavbar({
    super.key,
    this.onLeftItemPressed,
    this.onSignoutPressed,
    this.onAboutPressed,
  });

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
    return SizedBox(
      height: 40,
      width: 40,
      child: IconButton(
        icon: const Icon(LucideIcons.chevronLeft),
        onPressed: onLeftItemPressed,
      ),
    );
  }

  Widget get _title {
    return Text(
      "This App is a Joke",
      style: textTheme.titleSmall,
    );
  }

  Widget get _rightItems {
    return Row(
      children: [
        _button(icon: LucideIcons.mail, onPressed: null),
        _button(icon: LucideIcons.star, onPressed: null),
        _button(icon: LucideIcons.info, onPressed: onAboutPressed),
        _button(icon: LucideIcons.logOut, onPressed: onSignoutPressed),
      ],
    );
  }

  Widget _button({required IconData icon, required VoidCallback? onPressed}) {
    return SizedBox(
      height: 40,
      width: 40,
      child: IconButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed();
          }
        },
        icon: Icon(icon),
      ),
    );
  }
}
