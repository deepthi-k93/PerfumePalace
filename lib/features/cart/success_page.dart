import 'package:flutter/material.dart';
import 'package:project_entri/theme/colors.dart';
import 'package:project_entri/widgets/custom_app_bar_without_back.dart';
import 'package:project_entri/widgets/menu_drawer.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColours.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBarWithoutBack(
          title: "Ordered Successfully",
          showBack: false,
        ),
      ),
      drawer: MenuDrawer(),

      body: Padding(
        padding: const EdgeInsetsGeometry.all(10),
        child: Column(
          children: [
            // Center(child:
            Image.asset("images/success_image.jpg", fit: BoxFit.cover),
            // ),
            const SizedBox(height: 24),
            TextButton(
              child: const Text("Return to Home"),
              onPressed: () {
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil("/home", (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
