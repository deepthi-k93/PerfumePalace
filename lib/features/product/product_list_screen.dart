import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:project_entri/all_items.dart';
import 'package:project_entri/features/cart/cart_screen.dart';
import 'package:project_entri/features/cart/empty_cart.dart';
import 'package:project_entri/features/cart/firebase_cart_service.dart';
import 'package:project_entri/features/product/product_detail_screen.dart';
import 'package:project_entri/features/wishlist/wishlist.dart';
import 'package:project_entri/features/wishlist/firebase_wishlist_service.dart';
import 'package:project_entri/theme/colors.dart';
import 'package:badges/badges.dart';

class ProductListScreen extends StatelessWidget {
  final String category;

  const ProductListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final products = AllItems().products
        .where((p) => p["category"] == category)
        .toList();
    int cartProducts = 0;
    int wishlistProducts = 0;

    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
        backgroundColor: MyColours.bgColor,
        foregroundColor: Colors.white,
        actionsPadding: EdgeInsets.symmetric(horizontal: 16.0),
        actions: [
          // CART BUTTON
          Badge(
            position: BadgePosition.topEnd(top: 1, end: 1),
            badgeAnimation: BadgeAnimation.slide(
              animationDuration: Duration(milliseconds: 300),
              toAnimate: true,
            ),
            badgeStyle: BadgeStyle(
              badgeColor: MyColours.iconsColor,
              padding: EdgeInsetsGeometry.all(5),
            ),
            badgeContent: StreamBuilder<int>(
              stream: FirebaseCartService().getCartCount(user!.uid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  cartProducts = snapshot.data!;
                  return Text(
                    cartProducts.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else {
                  return Text(
                    "0",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
              },
            ),
            child: IconButton(
              onPressed: () {
                if (cartProducts > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmptyCart()),
                  );
                }
              },
              icon: Icon(
                Icons.shopping_bag_outlined,
                // color: MyColours.iconsColor,
              ),
            ),
          ),

          const SizedBox(width: 10),
          //FAVORITES BUTTON
          Badge(
            position: BadgePosition.topEnd(top: 1, end: 1),
            badgeAnimation: BadgeAnimation.slide(
              animationDuration: Duration(milliseconds: 300),
              toAnimate: true,
            ),
            badgeStyle: BadgeStyle(
              badgeColor: MyColours.iconsColor,
              padding: EdgeInsetsGeometry.all(5),
            ),
            badgeContent: StreamBuilder<int>(
              stream: FirebaseWishlistService().getWishlistCount(user.uid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  wishlistProducts = snapshot.data!;
                  return Text(
                    wishlistProducts.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else {
                  return Text(
                    "0",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
              },
            ),
            child: IconButton(
              onPressed: () {
                final user = FirebaseAuth.instance.currentUser;

                if (user == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please login first")),
                  );
                  return;
                }

                if (wishlistProducts > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const WishlistScreen()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmptyCart()),
                  );
                }
              },
              icon: Icon(
                Icons.favorite_border,
                // color: MyColours.iconsColor,
              ),
            ),
          ),
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
                              SizedBox(
                                width: double.infinity,
                                height: 140,
                                child: Image.asset(
                                  product["image"],
                                  fit: BoxFit.cover,
                                ),
                              ),

                              /// CONTENT
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      product["name"],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    const SizedBox(height: 2),

                                    Row(
                                      children: [
                                        if (product["price"] != 0.0)
                                          Text(
                                            "₹${product["price"].toStringAsFixed(0)}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: MyColours.bgColor,
                                              decoration:
                                                  TextDecoration.lineThrough,
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
                                    SizedBox(
                                      width: double.infinity,
                                      height: 20,
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

                                    // const SizedBox(height: 6),
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
                                    .collection("wishlist")
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
                  );
                },
              ),
      ),
    );
  }
}
