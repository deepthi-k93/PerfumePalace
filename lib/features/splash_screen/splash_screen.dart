import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:project_entri/features/home/view/home_screen.dart';
import 'package:project_entri/features/user/login/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:project_entri/reuse_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String appName = ""; //Values().appName;
  String version = ""; //Values().appName;
  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        appName = packageInfo.appName;
        version = packageInfo.version;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    ReuseFunctions.logPrint().i("Current user: ${user ?? 'None'}");
    if (user != null) {
      // User is signed in, navigate to HomeScreen
      Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });
    } else {
      // No user is signed in, navigate to LoginScreen
      Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      });
    }

    return Scaffold(
      backgroundColor: Colors.white, // white background
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo.webp",
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            SizedBox(height: 20),
            Text(version, style: TextStyle(fontSize: 16, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
