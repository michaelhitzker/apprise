import 'package:dad_jokes/style/colors.dart';
import 'package:dad_jokes/ui/about/about_screen.dart';
import 'package:dad_jokes/ui/home/home_screen.dart';
import 'package:dad_jokes/ui/login/login_screen.dart';
import 'package:dad_jokes/ui/login/sign_up_screen.dart';
import 'package:dad_jokes/ui/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dad_jokes/extensions/shared_preferences_extensions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sp = await SharedPreferences.getInstance();
  final info = await PackageInfo.fromPlatform();
  Get.put(sp);
  Get.put(info);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final SharedPreferences sp = Get.find();
    return GetMaterialApp(
      title: 'This App is a Joke',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: SGColors.accent,
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
              fontFamily: "Lexend", fontWeight: FontWeight.bold, fontSize: 20),
          titleSmall: TextStyle(
              fontFamily: "Lexend", fontWeight: FontWeight.bold, fontSize: 14),
          bodyMedium: TextStyle(fontFamily: "Lexend", fontSize: 13),
        ),
        useMaterial3: true,
      ),
      initialRoute: sp.isLoggedIn ? '/' : '/login',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/login',
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: '/signup',
          page: () => const SignUpScreen(),
        ),
        GetPage(
          name: '/onboarding',
          page: () => const OnboardingScreen(),
        ),
        GetPage(
          name: '/about',
          page: () => const AboutScreen(),
        ),
      ],
      home: const HomeScreen(),
    );
  }
}
