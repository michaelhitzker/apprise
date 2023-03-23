import 'package:flutter/material.dart';

class FillingScrollView extends StatelessWidget {
  final Widget child;
  final Axis scrollDirection;
  final ScrollController? controller;
  const FillingScrollView({
    Key? key,
    required this.child,
    this.controller,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: scrollDirection,
      controller: controller,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: child,
        ),
      ],
    );
  }
}
