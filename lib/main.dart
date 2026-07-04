import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_entri/features/cart/cart_screen.dart';
import 'package:project_entri/features/home/view/home_screen.dart';
import 'package:project_entri/features/splash_screen/splash_screen.dart';
import 'package:project_entri/features/user/login/view/login_screen.dart';
import 'package:project_entri/features/user/profile/profile_screen.dart';
import 'package:project_entri/features/user/register/view/register_screen.dart';
import 'package:project_entri/features/wishlist/wishlist.dart';
import 'package:project_entri/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),

      initialRoute: '/splash',

      routes: {
        '/home': (context) => const HomeScreen(),
        // '/products': (context) => const ProductListScreen(),
        '/cart': (context) => const CartScreen(),
        // '/orders': (context) => const OrderScreen(),
        '/wishlist': (context) => const WishlistScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        // '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
