import 'package:flutter/material.dart';
import 'package:project_entri/theme/colors.dart';
import 'package:project_entri/widgets/custom_app_bar.dart';
import 'package:project_entri/widgets/menu_drawer.dart';

class EmptyCart extends StatefulWidget {
  const EmptyCart({super.key});

  @override
  State<EmptyCart> createState() => _EmptyCartState();
}

class _EmptyCartState extends State<EmptyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColours.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(),
      ),
      drawer: MenuDrawer(),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(10),
        child: Center(child: Image.asset("images/empty_cart.jpg")),
      ),
    );
  }
}
