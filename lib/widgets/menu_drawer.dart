import 'package:flutter/material.dart';
import 'package:project_entri/all_items.dart';
import 'package:project_entri/features/home/view/home_screen.dart';
import 'package:project_entri/features/product/product_list_screen.dart';
import 'package:project_entri/features/user/profile/profile_screen.dart';
import 'package:project_entri/theme/colors.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: MyColours.bgColor),
            child: const Text(
              "Menu",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            },
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfileScreen()),
              );
            },
          ),

          const Divider(),

          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          ...AllItems().categories.map((cat) {
            return ListTile(
              title: Text(cat["name"]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductListScreen(category: cat["name"]),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
