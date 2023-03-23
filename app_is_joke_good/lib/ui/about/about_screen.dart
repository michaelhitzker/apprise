import 'package:dad_jokes/components/navbar.dart';
import 'package:dad_jokes/extensions/state_extensions.dart';
import 'package:dad_jokes/ui/login/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  late PackageInfo _info;

  @override
  void initState() {
    super.initState();
    _info = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Navbar(
              title: "About",
            ),
            const Expanded(
              child: LogoWidget(),
            ),
            _appInfo,
          ],
        ),
      ),
    );
  }

  Widget get _appInfo {
    final version = _info.version;
    final build = _info.buildNumber;

    return Text("This App is a Joke v$version+$build",
        style: textTheme.bodySmall?.copyWith(color: theme.hintColor));
  }
}
