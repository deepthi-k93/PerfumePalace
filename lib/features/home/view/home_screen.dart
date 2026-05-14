// ignore_for_file: strict_top_level_inference, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_entri/features/cart/cart_screen.dart';
import 'package:project_entri/features/cart/firebase_cart_service.dart';
import 'package:project_entri/features/product/product_detail_screen.dart';
import 'package:project_entri/features/product/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:project_entri/features/wishlist/wishlist.dart';
import 'package:project_entri/features/wishlist/wishlist_service.dart';
import 'package:project_entri/reuse_functions.dart';
import 'package:project_entri/theme/colors.dart';
import 'package:project_entri/theme/values.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.loggedUser});

  final String loggedUser;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  // Categories
  final List<Map<String, dynamic>> categories = const [
    {"name": "Perfumes", "image": "images/category/category1.webp"},
    {"name": "GiftSets", "image": "images/category/category2.webp"},
    {"name": "Deodorants", "image": "images/category/category3.webp"},
    {"name": "FragranceMists", "image": "images/category/category4.webp"},
    {"name": "BodyLotions", "image": "images/category/category5.webp"},
    {"name": "DeodorantStick", "image": "images/category/category6.webp"},
  ];

  //  FIXED PRODUCTS (price as double)
  final List<Map<String, dynamic>> products = const [
    {
      "id": "1",
      "name": "Rasasi Ice Perfume for men",
      "price": 5500.0,
      "offer_price": 3849.0,
      "image": "images/products/perfume1.webp",
      "category": "Perfumes",
      "description":
          "Experience complete confidence with Rasasi Hawas Ice Eau de Parfum, a 100 ml scent tailor-made for men. Infused with energy, the scent provides strength and assurance, leaving you empowered and ready to take on the world.\nFragrance Notes -\n\nTop Notes - Bergamot, Lemon, and mint\nMiddle Notes - Orange Blossoms, Cardamom, Plum & Blackcurrant\nBase Notes - Patchouli, Sandalwood, Amber & Tonka Beans.",
    },
    {
      "id": "2",
      "name": "Lattafa Yara Eau De Parfum 100ml For Women",
      "price": 4000.0,
      "offer_price": 2149.0,
      "image": "images/products/perfume2.webp",
      "category": "Perfumes",
      "description":
          "Indulge in the enchanting scent of Lattafa Yara Eau De Parfum. This 100ml fragrance for women is a perfect blend of sophistication and allure. Let the captivating notes of this perfume transport you to a world of elegance and charm. Truly irresistible!\nFragrance Notes -\n\nTop Notes: Tangerine, Heliotrope, Orchid\nHeart Notes :Tropical Notes, Gourmand\nBase Notes : Vanila, Sandalwood, Musk",
    },

    {
      "id": "3",
      "name": "Lattafa Khamrah Eau De Parfum 100ml For Men & Women",
      "price": 5000.0,
      "offer_price": 2949.0,
      "image": "images/products/perfume3.jpg",
      "category": "Perfumes",
      "description":
          "Lattafa Khamrah is a luxurious 100ml eau de parfum for men and women. This sophisticated fragrance blends warm spices, florals, and woody notes into a complex, long-lasting composition. Versatile enough for any occasion, it's ideal for those who appreciate refined, distinctive scents.\nFragrance Notes -\n\nTop Notes: Cognac\nMiddle notes : Tonka Bean , Cinnamon & Oak\nBase notes : Vanilla , Praline & Sandalwood",
    },
    {
      "id": "4",
      "name": "Gift Set Of Rasasi Hawas Ice Eau de Parfum 100ml For Men",
      "price": 6500.0,
      "offer_price": 3999.0,
      "image": "images/products/giftset1.webp",
      "category": "Gift Sets",
      "description":
          "Experience the ultimate chill with Rasasi Hawas Ice—a frosty fragrance that transforms your everyday moments into something extraordinary. This 100ml powerhouse delivers crisp, invigorating notes that awaken your senses and keep you feeling fresh all day long. Perfect for the modern man who refuses to play it safe, this gift set arrives beautifully packaged and ready to impress. Whether you're treating yourself or surprising someone special, Hawas Ice is your ticket to smelling absolutely legendary. Embrace the cool factor and let this iconic scent become your signature move.\n\nFragrance Notes -\n\nTop Notes - Bergamot, Lemon, and mint\nHeart Notes - Orange Blossoms, Cardamom, Plum & Blackcurrant\nBase Notes - Patchouli, Sandalwood, Amber & Tonka Beans.\n\nThis Set Includes -\n\n100ml EDP\n60ML Shower Gel\n10ml Travel Spray",
    },
    {
      "id": "5",
      "name":
          "Gift Set Of Armaf Club De Nuit Pink Eau De Parfum 105ml For Women",
      "price": 5000.0,
      "offer_price": 3145.0,
      "image": "images/products/giftset2.webp",
      "category": "Gift Sets",
      "description":
          "Unleash your inner playfulness with this gift set of Armaf Club De Nuit Pink Eau De Parfum. Featuring a sensual 105ml EDT and a refreshing 200ml deodorant, this set is perfect for the playful woman in your life. Let her embrace her quirky side with this unique and delightful gift set.\n\nFragrance Notes -\nTop Notes - Orange, Grapefruit, Bergamot and Peach;\nMiddle Notes - Rose, Geranium, Jasmine and Litchi;\nBase Notes - Patchouli, Vanilla, Musk and Vetiver.\n\nThis Gift Set Contains - \n\nArmaf Club De Nuit Women 105ml EDT \nArmaf Club De Nuit Women 200ml Deodorant ",
    }, // reached here
    {
      "id": "6",
      "name": "Calvin Klein One Deodorant 150ml For Men",
      "price": 1700.0,
      "offer_price": 1360.0,
      "image": "images/products/deo1.webp",
      "category": "Deodorants",
      "description":
          "Calvin Klein One Deodorant 150ml for Men offers a refined and long-lasting freshness that complements your lifestyle. Its subtle yet distinctive scent ensures all-day confidence while maintaining a clean, invigorating feeling. ",
    },
    {
      "id": "7",
      "name": "Armaf Club De Nuit Pink Deodorant Body Spray For Women 200 ML",
      "price": 349.0,
      "offer_price": 299.0,
      "image": "images/products/deo2.webp",
      "category": "Deodorants",
      "description":
          "Experience all-day freshness with Armaf Club De Nuit Deodorant Body Spray. This 200 ML spray is specially designed for women, providing long-lasting protection against body odor. Its luxurious fragrance will leave you feeling confident and refreshed. A must-have for any woman's daily routine.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    ReuseFunctions.logPrint().i(
      "USER IN HOME: ${FirebaseAuth.instance.currentUser}",
    );
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: MyColours.bgColor,
        centerTitle: true,
        title: Text(Values().appName),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishlistScreen()),
              );
            },
            icon: const Icon(Icons.favorite_border),
          ),

          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),

          const SizedBox(width: 8),
        ],
      ),

      // DRAWER
      drawer: Drawer(
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
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (_) => ProfileScreen()),
                // );
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

            ...categories.map((cat) {
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
      ),

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
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final cat = categories[index];
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
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.70,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
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
                                user.uid, product);

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
            child:StreamBuilder<DocumentSnapshot>(
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
            await WishlistService.removeFromWishlist(
                user.uid, product["id"]);
          } else {
            await WishlistService.addToWishlist(
                user.uid, product);
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