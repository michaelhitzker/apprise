import 'package:dad_jokes/extensions/state_extensions.dart';
import 'package:dad_jokes/style/spacings.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "This App is a Joke",
          style: textTheme.titleMedium,
        ),
        const SizedBox(
          height: SGSpacings.large,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            "assets/doge_meme.jpg",
            width: 200,
            height: 200,
          ),
        ),
      ],
    );
  }
}
