import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_entri/features/cart/cart_screen.dart';
import 'package:project_entri/features/product/product_detail_screen.dart';
import 'package:project_entri/features/wishlist/wishlist.dart';
import 'package:project_entri/features/wishlist/wishlist_service.dart';
import 'package:project_entri/theme/colors.dart';

class ProductListScreen extends StatelessWidget {
  final String category;

  ProductListScreen({super.key, required this.category});

  // IMAGE LIST
  final Map<String, List<String>> productImages = {
    "Perfumes": [
      "images/products/perfume1.webp",
      "images/products/perfume2.webp",
      "images/products/perfume3.jpg",
      "images/products/perfume4.webp",
      "images/products/perfume5.webp",
      "images/products/perfume6.webp",
      "images/products/perfume7.webp",
      "images/products/perfume8.webp",
      "images/products/perfume9.webp",
      "images/products/perfume10.webp",
    ],
    "GiftSets": [
      "images/products/giftset1.webp",
      "images/products/giftset2.webp",
      "images/products/giftset3.webp",
      "images/products/giftset4.webp",
      "images/products/giftset5.webp",
      "images/products/giftset6.webp",
      "images/products/giftset7.webp",
      "images/products/giftset8.webp",
      "images/products/giftset9.webp",
      "images/products/giftset10.webp",
    ],
    "Deodorants": [
      "images/products/deodorant1.webp",
      "images/products/deodorant2.webp",
      "images/products/deodorant3.webp",
      "images/products/deodorant4.webp",
      "images/products/deodorant5.webp",
      "images/products/deodorant6.webp",
      "images/products/deodorant7.webp",
      "images/products/deodorant8.webp",
      "images/products/deodorant9.webp",
      "images/products/deodorant10.webp",
      "images/products/deodorant11.webp",
      "images/products/deodorant12.webp",
    ],
    "FragranceMists": [
      "images/products/mist1.webp",
      "images/products/mist2.webp",
      "images/products/mist3.webp",
      "images/products/mist4.webp",
      "images/products/mist5.webp",
      "images/products/mist6.webp",
      "images/products/mist7.webp",
      "images/products/mist8.webp",
      "images/products/mist9.webp",
      "images/products/mist10.webp",
    ],
    "BodyLotions": [
      "images/products/lotion1.webp",
      "images/products/lotion2.webp",
      "images/products/lotion3.webp",
      "images/products/lotion4.webp",
      "images/products/lotion5.webp",
      "images/products/lotion6.webp",
      // "assets/images/clutches7.webp",
      // "assets/images/clutches8.webp",
      // "assets/images/clutches9.webp",
      // "assets/images/clutches10.webp",
    ],
    "DeodorantStick": [
      "images/products/stick1.webp",
      "images/products/stick2.webp",
      "images/products/stick3.webp",
      "images/products/stick4.webp",
      "images/products/stick5.webp",
      "images/products/stick6.webp",
      "images/products/stick7.webp",
      "images/products/stick8.webp",
      "images/products/stick9.webp",
      "images/products/stick10.webp",
    ],
  };

  /// GENERATE PRODUCTS
  List<Map<String, dynamic>> get allProducts {
    List<Map<String, dynamic>> products = [];

    productImages.forEach((categoryName, images) {
      for (int i = 0; i < images.length; i++) {
        products.add({
          "id": "$categoryName-$i", //
          "name": "$categoryName ${i + 1}",
          "price": 800 + i * 50, //
          "image": images[i],
          "category": categoryName,
        });
      }
    });

    return products;
  }

  @override
  Widget build(BuildContext context) {
    final products = allProducts
        .where((p) => p["category"] == category)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
        backgroundColor: MyColours.bgColor,
        foregroundColor: Colors.white,
        actions: [
          //FAVORITES BUTTON
          IconButton(
            onPressed: () {
              final user = FirebaseAuth.instance.currentUser;

              if (user == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please login first")),
                );
                return;
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const WishlistScreen(),
                ),
              );
            },
            icon: const Icon(Icons.favorite_border),
          ),

          // CART BUTTON
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),

          const SizedBox(width: 10),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: products.isEmpty
            ? const Center(child: Text("No products found"))
            : GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  final user = FirebaseAuth.instance.currentUser;

                  return Stack(
                    children: [
                      /// PRODUCT CARD
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ProductDetailScreen(product: product),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[200],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Image.asset(
                                    product["image"],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),

                              /// CONTENT
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      product["name"],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      "₹.${product["price"]}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: MyColours.bgColor,
                                      ),
                                    ),

                                    // const SizedBox(height: 6),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 10,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: MyColours.bgColor,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  ProductDetailScreen(
                                                    product: product,
                                                  ),
                                            ),
                                          );
                                        },
                                        child: const Text("View"),
                                      ),
                                    ),

                                    const SizedBox(height: 6),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // FAVORITE ICON
                      Positioned(
                        top: 5,
                        right: 5,
                        child: StreamBuilder<DocumentSnapshot>(
                          stream: user != null
                              ? FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(user.uid)
                                    .collection("favorites")
                                    .doc(product["id"])
                                    .snapshots()
                              : const Stream.empty(),
                          builder: (context, snapshot) {
                            final isFav = snapshot.data?.exists ?? false;

                            return CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 18,
                              child: IconButton(
                                iconSize: 18,
                                icon: Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
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

                                  if (isFav) {
                                    await WishlistService.removeFromWishlist(
                                      user.uid,
                                      product["id"],
                                    );
                                  } else {
                                    await WishlistService.addToWishlist(
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
                  );
                },
              ),
      ),
    );
  }
}
