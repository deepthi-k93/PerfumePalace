import 'package:flutter/material.dart';

import 'package:project_entri/theme/colors.dart';

class CustomAppBarWithoutBack extends StatelessWidget
    implements PreferredSizeWidget {
  final bool showBack;

  final String title;

  // ignore: use_key_in_widget_constructors
  const CustomAppBarWithoutBack({required this.title, this.showBack = false});

  @override
  Widget build(BuildContext context) {
    // int cartProducts = 0;
    return AppBar(
      backgroundColor: MyColours.bgColor,
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.0),
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(Icons.menu, color: MyColours.iconsColor),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ), // Image.asset("images/logo/expense-tracking.jpg"),

      centerTitle: true,

      actions: [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
