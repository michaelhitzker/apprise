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
        child: Padding(
          padding: const EdgeInsets.only(bottom: SGSpacings.large),
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
                    TextButton(
                      onPressed: () {
                        Get.toNamed("signup");
                      },
                      child: Container(
                        width: 200,
                        alignment: Alignment.center,
                        child: const Text("Sign up"),
                      ),
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: Container(
                        width: 200,
                        alignment: Alignment.center,
                        child: const Text("Login"),
                      ),
                    ),
                    _socialLogins
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _socialLogins {
    List<Widget> children = [
      _socialLogin(FontAwesomeIcons.google),
      _socialLogin(FontAwesomeIcons.apple),
      _socialLogin(FontAwesomeIcons.facebook)
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children.insertEvery(
        1,
        const SizedBox(width: SGSpacings.medium),
      ),
    );
  }

  Widget _socialLogin(IconData icon) {
    return OutlinedButton(
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 18,
        ),
      ),
      onPressed: () {},
    );
  }
}
