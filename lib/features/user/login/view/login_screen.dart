// ignore_for_file: use_build_context_synchronously

import 'package:project_entri/auth_service.dart';
import 'package:project_entri/theme/colors.dart';
import 'package:project_entri/widgets/custom_app_bar_without_back.dart';
import 'package:project_entri/widgets/custom_button.dart';
import 'package:project_entri/features/home/view/home_screen.dart';
import 'package:project_entri/features/user/register/view/register_screen.dart';
import 'package:project_entri/reuse_functions.dart';
import 'package:flutter/material.dart';
import 'package:project_entri/widgets/menu_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// final _formKey = GlobalKey<FormState>();
String email = '';
String pwd = '';
bool obscureText = true;

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool isLoading = false;
  bool obscurePassword = true;

  // 🔥 FIXED - Manual navigation to HomeScreen
  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      ReuseFunctions.logPrint().i("🔥 Logging in: ${email.text}");
      final user = await AuthService.login(
        email.text.trim(),
        password.text.trim(),
      );

      // 🔥 CRITICAL mounted check BEFORE setState
      if (!mounted) return;
      setState(() => isLoading = false);

      if (user != null) {
        ReuseFunctions.logPrint().i("✅ User logged in: ${user.email}");
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        // To write data
        // bool pr = prefs.containsKey(email.text.trim());
        // To write data
        await prefs.setBool("loggedIn", true);
        await prefs.setString("loggedInUser", email.text.trim());

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login successful! Redirecting...")),
        );

        // 🔥 DELAY + NAVIGATION (same as Register)
        await Future.delayed(const Duration(milliseconds: 1500));

        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
          );
        }
      } else {
        ReuseFunctions.logPrint().i("❌ Login failed - user is null");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid email or password")),
        );
      }
    } catch (e) {
      ReuseFunctions.logPrint().i("💥 Login error: $e");
      if (!mounted) return;
      setState(() => isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithoutBack(title: "Login"),
            drawer: MenuDrawer(),

      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset("images/logo.webp", height: 250),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Welcome..",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const Text(
                  "Login to continue",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 20),

                /// EMAIL
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email cannot be empty";
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                /// PASSWORD
                TextFormField(
                  controller: password,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password cannot be empty";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 25),

                CustomButton(
                  text: "Login",
                  isLoading: isLoading,
                  onPressed: login,
                ),

                const SizedBox(height: 10),

                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterScreen(),
                        ),
                      );
                    },
                    child:  Text(
                      "Don't have an account? Register",
                      style: TextStyle(color: MyColours.bgColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
