import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_entri/auth_service.dart';
import 'package:project_entri/features/orders/firebase_order_service.dart';
import 'package:project_entri/theme/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Scaffold(body: Center(child: Text("User not logged in")));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: MyColours.bgColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final shouldLogout = await showDialog<bool>(
                context: context,
                builder: (dialogContext) => AlertDialog(
                  title: const Text("Logout"),
                  content: const Text("Are you sure you want to logout?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(dialogContext, false),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(dialogContext, true),
                      child: const Text("Logout"),
                    ),
                  ],
                ),
              );

              if (shouldLogout == true) {
                await AuthService.logout();

                if (!context.mounted) return;

                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil("/login", (route) => false);
              }
            },
          ),
        ],
      ),

      body: Column(
        children: [
          // USER INFO SECTION
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(user.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                );
              }

              if (!snapshot.data!.exists) {
                //CREATE USER DOCUMENT AUTOMATICALLY
                FirebaseFirestore.instance
                    .collection("users")
                    .doc(user.uid)
                    .set({
                      "name": user.displayName ?? "",
                      "email": user.email ?? "",
                      "phone": "",
                      "createdAt": FieldValue.serverTimestamp(),
                    });

                //SHOW TEMP TEXT WHILE DATA IS BEING CREATED
                return const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Setting up profile..."),
                );
              }

              final data = snapshot.data!.data() as Map<String, dynamic>;

              final name = data['name'] ?? '';
              final email = data['email'] ?? user.email;
              final phone = data['phone'] ?? '';

              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    // Avatar
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: MyColours.bgColor,
                      child: Text(
                        name.isNotEmpty ? name[0].toUpperCase() : "U",
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    // Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(email),
                          Text(phone),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 10),

          // ORDER TITLE
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "My Orders",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // ORDERS LIST
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseOrderService.getOrders(user.uid),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final orders = snapshot.data!.docs;

                if (orders.isEmpty) {
                  return const Center(child: Text("No orders yet 🛍️"));
                }

                return ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    final items = order["items"];

                    return Card(
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ExpansionTile(
                        title: Text(
                          "₹${order['total']}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(order['date'].toDate().toString()),
                        children: items.map<Widget>((item) {
                          return ListTile(
                            leading: Image.asset(item['image'], width: 40),
                            title: Text(item['name']),
                            trailing: Text("₹${item['offer_price']}"),
                          );
                        }).toList(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
