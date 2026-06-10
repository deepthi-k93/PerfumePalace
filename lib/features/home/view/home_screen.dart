// ignore_for_file: use_build_context_synchronously, strict_top_level_inference, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_entri/all_items.dart';
import 'package:project_entri/features/cart/firebase_cart_service.dart';
import 'package:project_entri/features/product/product_detail_screen.dart';
import 'package:project_entri/features/product/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:project_entri/features/wishlist/firebase_wishlist_service.dart';
import 'package:project_entri/reuse_functions.dart';
import 'package:project_entri/theme/colors.dart';
import 'package:project_entri/widgets/custom_app_bar.dart';
import 'package:project_entri/widgets/menu_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // final String loggedUser;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  // final List<Map<String, dynamic>> categories = AllItems().categories;
  @override
  Widget build(BuildContext context) {
    ReuseFunctions.logPrint().i(
      "USER IN HOME: ${FirebaseAuth.instance.currentUser}",
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(),
      ),
      drawer: MenuDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SEARCH
              TextField(
                decoration: InputDecoration(
                  hintText: "Search Perfumes...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // BANNER
              SizedBox(
                height: 160,
                child: PageView(
                  children: [
                    _buildBanner("images/banner1.jpeg"),
                    _buildBanner("images/banner2.jpeg"),
                    // _buildBanner("images/banner3.png"),
                    // _buildBanner("images/banner4.png"),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // CATEGORIES
              const Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AllItems().categories.length,
                  itemBuilder: (context, index) {
                    final cat = AllItems().categories[index];
                    return _categoryItem(context, cat["name"], cat["image"]);
                  },
                ),
              ),

              const SizedBox(height: 20),

              // PRODUCTS
              const Text(
                "Popular Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AllItems().products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.70,
                ),
                itemBuilder: (context, index) {
                  final product = AllItems().products[index];
                  return _productCard(product, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // CATEGORY UI
  Widget _categoryItem(BuildContext context, String title, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProductListScreen(category: title)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 14),
        child: Column(
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 13)),
          ],
        ),
      ),
    );
  }

  // PRODUCT CARD UI
  Widget _productCard(Map<String, dynamic> product, BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Stack(
          children: [
            /// MAIN CONTENT
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(product["image"], fit: BoxFit.cover),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product["name"],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            "₹${product["price"].toStringAsFixed(0)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColours.bgColor,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.red,
                              decorationThickness: 2.0,
                            ),
                          ),
                          const SizedBox(width: 10),

                          Text(
                            "₹${product["offer_price"].toStringAsFixed(0)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColours.bgColor,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      /// ADD TO CART
                      SizedBox(
                        width: double.infinity,
                        height: 35,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColours.bgColor,
                          ),
                          onPressed: () async {
                            if (user == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please login first"),
                                ),
                              );
                              return;
                            }

                            await FirebaseCartService.addToCart(
                              user.uid,
                              product,
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "${product["name"]} added to cart",
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),

            // Wishlist ICON (FIXED)
            Positioned(
              top: 8,
              right: 8,
              child: StreamBuilder<DocumentSnapshot>(
                stream: user != null
                    ? FirebaseFirestore.instance
                          .collection("users")
                          .doc(user.uid)
                          .collection("wishlist")
                          .doc(product["id"])
                          .snapshots()
                    : const Stream.empty(),
                builder: (context, snapshot) {
                  final isFav = snapshot.data?.exists ?? false;

                  return CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () async {
                        if (user == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please login first")),
                          );
                          return;
                        }

                        if (isFav) {
                          await FirebaseWishlistService.removeFromWishlist(
                            user.uid,
                            product["id"],
                          );
                        } else {
                          await FirebaseWishlistService.addToWishlist(
                            user.uid,
                            product,
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner(String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
