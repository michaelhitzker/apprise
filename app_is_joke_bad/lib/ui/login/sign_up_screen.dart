import 'package:dad_jokes/components/loading_dialog.dart';
import 'package:dad_jokes/extensions/shared_preferences_extensions.dart';
import 'package:dad_jokes/extensions/state_extensions.dart';
import 'package:dad_jokes/components/filling_scroll_view.dart';
import 'package:dad_jokes/components/keyboard_dismiss_gesture_detector.dart';
import 'package:dad_jokes/extensions/string_extensions.dart';
import 'package:dad_jokes/style/spacings.dart';
import 'package:dad_jokes/ui/login/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _tac = """
Sure, here are some sample terms and conditions for your app:

Introduction
Welcome to our app! These terms and conditions ("Terms") apply to your use of our app, including any content, features, and services provided through the app. By using our app, you agree to these Terms, as well as any additional terms that may apply to specific features or services. Please read these Terms carefully before using our app.

User Accounts
You may be required to create a user account to use certain features of our app. You are responsible for maintaining the confidentiality of your account login credentials and for all activities that occur under your account. You agree to immediately notify us of any unauthorized use of your account or any other breach of security.

User Content
Our app may allow you to upload, post, or otherwise submit content ("User Content"). You retain ownership of any User Content you submit, but you grant us a non-exclusive, worldwide, royalty-free, perpetual, irrevocable, and sublicensable license to use, copy, modify, distribute, and display your User Content in connection with our app.

You represent and warrant that your User Content does not violate any third-party rights, including intellectual property rights, and is not illegal, obscene, defamatory, or otherwise objectionable.

Prohibited Conduct
You agree not to use our app for any unlawful or unauthorized purpose. You also agree not to engage in any conduct that could damage, disable, overburden, or impair our app, including but not limited to:

Use any automated means to access our app or collect any information from our app;
Transmit any viruses, worms, or other harmful software;
Interfere with or disrupt any servers or networks connected to our app;
Attempt to access any other user's account without permission;
Harass, threaten, or intimidate other users of our app.
""";

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _pwFocusNode = FocusNode();

  String? _passwordError;
  String? _emailError;

  late SharedPreferences _sp;

  @override
  void initState() {
    super.initState();
    _sp = Get.find();
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    _emailFocusNode.addListener(_onEmailFocusChanged);
    _pwFocusNode.addListener(_onPasswordFocusChanged);
  }

  @override
  void dispose() {
    _emailController.removeListener(_onEmailChanged);
    _passwordController.removeListener(_onPasswordChanged);
    _emailFocusNode.removeListener(_onEmailFocusChanged);
    _pwFocusNode.removeListener(_onPasswordFocusChanged);
    super.dispose();
  }

  bool _validateEmail({bool onlyUpdateErrors = false}) {
    final email = _emailController.text;
    _emailError = null;
    if (email.isEmpty) {
      _emailError = "Please fill in your email";
      setState(() {});
      return false;
    }
    if (email.isEmail == false) {
      _emailError = "Please make sure your email is valid";
      setState(() {});
      return false;
    }
    setState(() {});
    return true;
  }

  bool _validatePassword({bool onlyUpdateErrors = false}) {
    final pw = _passwordController.text;
    _passwordError = null;
    if (pw.isEmpty) {
      _passwordError = "Must not be empty";
      setState(() {});
      return false;
    }
    if (pw.isPassword == false) {
      _passwordError =
          "Must contain at least 1 special character and the blood of your first born";
      setState(() {});
      return false;
    }
    setState(() {});
    return true;
  }

  void _validate({bool onlyUpdateErrors = false}) {
    final emailValid = _validateEmail(onlyUpdateErrors: onlyUpdateErrors);
    final pwValid = _validatePassword(onlyUpdateErrors: onlyUpdateErrors);
    if (pwValid == false || emailValid == false || onlyUpdateErrors) {
      return;
    }
    _signUp();
  }

  Future<void> _signUp() async {
    await showGeneralErrorAlert(
        title: "Accept terms and conditions",
        message:
            "By using the app you agree to our terms and conditions:\n$_tac");
            
    await showDialog(
      context: context,
      builder: (context) => const LoadingDialog(
        title: "Signing you up...",
      ),
    );
    _sp.isLoggedIn = true;
    Get.offAllNamed("/");
  }

  void _onPasswordChanged() {
    _passwordError = null;
    setState(() {});
  }

  void _onEmailChanged() {}

  void _onEmailFocusChanged() {
    if (_emailFocusNode.hasFocus) {
      return;
    }
    _validateEmail(onlyUpdateErrors: true);
  }

  void _onPasswordFocusChanged() {
    if (_pwFocusNode.hasFocus) {
      return;
    }
    _validatePassword(onlyUpdateErrors: true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(SGSpacings.large),
              child: SizedBox.expand(
                child: FillingScrollView(
                  child: Column(
                    children: [
                      Align(alignment: Alignment.topLeft, child: _backButton),
                      const Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: LogoWidget(),
                        ),
                      ),
                      _bottomContent
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        onWillPop: () async => false);
  }

  Widget get _bottomContent {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Sign up",
            style: textTheme.titleSmall,
          ),
        ),
        const SizedBox(height: SGSpacings.medium),
        _emailInput,
        const SizedBox(height: SGSpacings.medium),
        _passwordInput,
        const SizedBox(height: SGSpacings.xLarge),
        TextButton(
          onPressed: _validate,
          child: Container(
            width: 200,
            alignment: Alignment.center,
            child: const Text("Done"),
          ),
        ),
      ],
    );
  }

  Widget get _emailInput {
    return TextField(
      style: textTheme.bodyMedium,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        hintText: "Email",
        errorText: _emailError,
        hintStyle: textTheme.bodyMedium,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget get _passwordInput {
    return Column(
      children: [
        TextField(
          style: textTheme.bodyMedium,
          obscureText: true,
          onSubmitted: (text) => _validate(),
          controller: _passwordController,
          focusNode: _pwFocusNode,
          decoration: InputDecoration(
              hintText: "Password",
              errorText: _passwordError,
              hintStyle: textTheme.bodyMedium,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        ),
        const SizedBox(height: SGSpacings.small),
      ],
    );
  }

  Widget get _backButton {
    return IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(
        LucideIcons.chevronLeft,
        size: 24,
      ),
    );
  }
}
