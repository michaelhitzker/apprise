import 'package:dad_jokes/extensions/button_extensions.dart';
import 'package:dad_jokes/extensions/list_extensions.dart';
import 'package:dad_jokes/style/spacings.dart';
import 'package:dad_jokes/ui/login/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              const Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: LogoWidget(),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilledButton(
                    onPressed: () {
                      Get.toNamed("signup");
                    },
                    child: Container(
                      width: 200,
                      alignment: Alignment.center,
                      child: const Text("Sign up"),
                    ),
                  ).noFeedbackButton(),
                  FilledButton(
                    onPressed: () {},
                    child: Container(
                      width: 200,
                      alignment: Alignment.center,
                      child: const Text("Login"),
                    ),
                  ).noFeedbackButton(),
                  _socialLogins
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _socialLogins {
    List<Widget> children = [
      _socialLogin(FontAwesomeIcons.google, "Login with Google"),
      _socialLogin(FontAwesomeIcons.apple, "Login with Apple"),
      _socialLogin(FontAwesomeIcons.facebook, "Login with Facebook")
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children.insertEvery(
        1,
        const SizedBox(width: SGSpacings.medium),
      ),
    );
  }

  Widget _socialLogin(IconData icon, String text) {
    return FilledButton.icon(
      icon: Icon(
        icon,
        size: 18,
      ),
      label: Text(text),
      onPressed: () {},
    ).noFeedbackButton();
  }
}
