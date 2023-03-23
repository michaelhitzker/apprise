import 'package:dad_jokes/extensions/state_extensions.dart';
import 'package:dad_jokes/components/keyboard_dismiss_gesture_detector.dart';
import 'package:dad_jokes/style/spacings.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissGestureDetector(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(SGSpacings.xLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi there 👋",
                  style: textTheme.titleMedium,
                ),
                Text(
                  "Welcome to the home of bad jokes. In order for you to enjoy the real bad jokes, please confirm your age.",
                  style: textTheme.bodyMedium,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
