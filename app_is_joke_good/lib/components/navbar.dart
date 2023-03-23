import 'package:dad_jokes/extensions/state_extensions.dart';
import 'package:dad_jokes/style/spacings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Navbar extends StatelessWidget {
  final String title;
  const Navbar({super.key, required this.title});

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
            _rightItem,
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
        onPressed: () => Get.back(),
      ),
    );
  }

  Widget get _title {
    return Text(
      title,
      style: textTheme.titleSmall,
    );
  }

  Widget get _rightItem {
    return const SizedBox(
      height: 40,
      width: 40,
    );
  }
}
