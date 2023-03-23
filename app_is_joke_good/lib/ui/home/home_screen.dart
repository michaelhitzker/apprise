import 'package:dad_jokes/components/two_action_dialog.dart';
import 'package:dad_jokes/extensions/state_extensions.dart';
import 'package:dad_jokes/model/joke.dart';
import 'package:dad_jokes/style/spacings.dart';
import 'package:dad_jokes/ui/home/main_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences _sp;

  final _jokes = Jokes.haha();
  var _currentIndex = 0;
  bool _punchlineVisible = false;

  Joke get _joke {
    return _jokes[_currentIndex];
  }

  @override
  void initState() {
    super.initState();
    _sp = Get.find();
  }

  void _nextJoke() {
    if (_currentIndex >= _jokes.length) {
      _currentIndex = 0;
    } else {
      _currentIndex += 1;
    }
    _punchlineVisible = false;
    setState(() {});
  }

  void _previousJoke() {
    if (_currentIndex <= 0) {
      _currentIndex = 0;
    } else {
      _currentIndex -= 1;
    }

    _punchlineVisible = false;
    setState(() {});
  }

  void _signOut() {
    showDialog(
      context: context,
      builder: (context) => TwoActionDialog(
        title: "Sign out",
        message: "Do you really want to sign out?",
        yesText: "Yes",
        noText: "No",
        onNoPressed: () {
          Get.back();
        },
        onYesPressed: () {
          _sp.clear();
          Get.offAllNamed("login");
        },
      ),
    );
  }

  void _openAbout() {
    Get.back(); //close action sheet
    Get.toNamed("about");
  }

  void _openActionSheet() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Theme(
            data: ThemeData(primarySwatch: Colors.blue),
            child: CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {},
                  child: const Text("Give Feedback"),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {},
                  child: const Text("Rate the app"),
                ),
                CupertinoActionSheetAction(
                  onPressed: _openAbout,
                  child: const Text("About"),
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                onPressed: _signOut,
                isDestructiveAction: true,
                child: const Text("Sign out"),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: MainNavbar(
          onRightItemPressed: _openActionSheet,
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onLongPress: () => _signOut,
        onTap: () {
          if (_punchlineVisible || _joke.punchline == null) {
            _nextJoke();
            return;
          }
          _punchlineVisible = true;
          setState(() {});
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(SGSpacings.xLarge),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _jokeWidget,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _actionButton(
                        icon: LucideIcons.chevronLeft,
                        text: "Previous Joke",
                        outlined: true,
                        onPressed: _currentIndex == 0 ? null : _previousJoke),
                    _actionButton(
                        icon: LucideIcons.chevronRight,
                        text: "Next Joke",
                        iconOnRightSide: true,
                        onPressed: _nextJoke)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _actionButton(
      {required IconData icon,
      required String text,
      bool iconOnRightSide = false,
      bool outlined = false,
      VoidCallback? onPressed}) {
    List<Widget> children = [Icon(icon), Text(text)];
    if (iconOnRightSide) {
      children = children.reversed.toList();
    }
    final child = Row(
      children: children,
    );
    return GestureDetector(
      onTap: () {},
      child: outlined
          ? OutlinedButton(onPressed: onPressed, child: child)
          : FilledButton(onPressed: onPressed, child: child),
    );
  }

  Widget get _jokeWidget {
    List<Widget> children = [];
    children.add(
      Text(
        _joke.joke,
        style: textTheme.titleMedium,
      ),
    );
    final punchline = _joke.punchline;
    if (punchline != null) {
      children.add(_punchlineOrPlaceholder(punchline));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  Widget _punchlineOrPlaceholder(String punchline) {
    Widget? child;
    if (_punchlineVisible) {
      child = Text(
        punchline,
        style: textTheme.bodyMedium,
      );
    }
    return SizedBox(
      height: 20,
      child: child,
    );
  }
}
