// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart' hide Badge;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_entri/features/cart/cart_screen.dart';
import 'package:project_entri/features/cart/empty_cart.dart';
import 'package:project_entri/features/cart/firebase_cart_service.dart';
import 'package:project_entri/features/cart/payment_screen.dart';
import 'package:project_entri/features/wishlist/firebase_wishlist_service.dart';
import 'package:project_entri/features/wishlist/wishlist.dart';
import 'package:project_entri/theme/colors.dart';
import 'package:badges/badges.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // SAFE PRICE CONVERSION (IMPORTANT)
    double price = product["price"] is String
        ? double.tryParse(product["price"].replaceAll("₹", "")) ?? 0
        : (product["price"] as num).toDouble();

    double offerPrice = product["offer_price"] is String
        ? double.tryParse(product["offer_price"].replaceAll("₹", "")) ?? 0
        : (product["offer_price"] as num).toDouble();
    int cartProducts = 0;
    int wishlistProducts = 0;

    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColours.bgColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(product["name"]),
        actions: [
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

        /*  IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WishlistScreen()),
              );
            },
            icon: const Icon(Icons.favorite_border),
          ),
          const SizedBox(width: 10),

          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),

          const SizedBox(width: 10),*/
        ],
      ),

      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                //PRODUCT IMAGE
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Image.asset(product["image"], fit: BoxFit.contain),
                  ),
                ),

                // PRODUCT DETAILS
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // NAME
                        Text(
                          product["name"],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),
                        Row(
                          children: [
                            if (product["price"] != 0.0)
                              Text(
                                '₹${price.toStringAsFixed(0)}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: MyColours.bgColor,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  decorationThickness: 2.0,
                                ),
                              ),
                            const SizedBox(width: 10),
                            Text(
                              "₹${offerPrice.toStringAsFixed(0)}",
                              style: TextStyle(
                                fontSize: 20,
                                color: MyColours.bgColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // CATEGORY
                        Text(
                          "Category: ${product["category"]}",
                          style: const TextStyle(fontSize: 14),
                        ),

                        const SizedBox(height: 10),

                        // BUTTONS
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            /// ADD TO CART
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                ),
                                onPressed: () async {
                                  final user =
                                      FirebaseAuth.instance.currentUser;

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
                                    {
                                      'id': product['id'],
                                      'name': product['name'],
                                      'price': price,
                                      'offer_price': offerPrice,
                                      'image': product['image'],
                                    },
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
                            const SizedBox(width: 10),

                            /// BUY NOW
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColours.bgColor,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                ),
                                onPressed: () {
                                  final user =
                                      FirebaseAuth.instance.currentUser;

                                  if (user == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Please login first"),
                                      ),
                                    );
                                    return;
                                  }

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaymentScreen(
                                        total: offerPrice,
                                        items: [
                                          {
                                            'id': product['id'],
                                            'name': product['name'],
                                            'price': price,
                                            'offer_price': offerPrice,
                                            'image': product['image'],
                                          },
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Buy Now",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),

                        // DESCRIPTION
                        Text(
                          product["description"],
                          style: TextStyle(fontSize: 14, height: 1.4),
                        ),

                        const SizedBox(height: 20),

                        // RATINGS
                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star_half, color: Colors.amber),
                            Icon(Icons.star_border, color: Colors.amber),
                            SizedBox(width: 5),
                            Text("(120 reviews)"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
