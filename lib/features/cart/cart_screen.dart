import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_entri/features/cart/firebase_cart_service.dart';
import 'package:project_entri/features/cart/payment_screen.dart';
import 'package:project_entri/theme/colors.dart';
import 'package:project_entri/widgets/custom_app_bar.dart';
import 'package:project_entri/widgets/menu_drawer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(),
      ),
      drawer: MenuDrawer(),

      body: user == null
          ? const Center(child: Text("Please login first"))
          : StreamBuilder(
              stream: FirebaseCartService.getCart(user.uid),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final docs = snapshot.data!.docs;

                if (docs.isEmpty) {
                  return const Center(
                    child: Text(
                      "Your cart is empty 🛒",
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }

                double total = 0;

                for (var doc in docs) {
                  total += (doc["price"] ?? 0);
                }

                return Column(
                  children: [
                    /// CART LIST
                    Expanded(
                      child: ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          final item = docs[index];

                          return Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              leading: Image.asset(
                                item["image"],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              title: Text(item["name"]),
                              subtitle: Text("₹${item["price"].toString()}"),

                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () async {
                                  await FirebaseCartService.deleteItem(
                                    user.uid,
                                    item.id,
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    /// TOTAL + CHECKOUT
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "₹${total.toStringAsFixed(0)}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: MyColours.bgColor,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColours.bgColor,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PaymentScreen(
                                      total: total,
                                      items: docs
                                          .map(
                                            (e) =>
                                                e.data()
                                                    as Map<String, dynamic>,
                                          )
                                          .toList(),
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                "Checkout",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
