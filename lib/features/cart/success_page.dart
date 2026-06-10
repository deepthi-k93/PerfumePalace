import 'package:flutter/material.dart';
import 'package:project_entri/theme/colors.dart';
import 'package:project_entri/widgets/custom_app_bar.dart';

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
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(10),
        child: Center(child: Image.asset("images/success_image.jpg")),
      ),
    );
  }
}
