import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:project_entri/features/cart/cart_screen.dart';
import 'package:project_entri/features/cart/empty_cart.dart';
import 'package:project_entri/features/cart/firebase_cart_service.dart';
import 'package:project_entri/features/user/profile/profile_screen.dart';
import 'package:project_entri/features/wishlist/firebase_wishlist_service.dart';
import 'package:project_entri/features/wishlist/wishlist.dart';
import 'package:project_entri/theme/colors.dart';
import 'package:project_entri/theme/values.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    int cartProducts = 0;
    int wishlistProducts = 0;
    final user = FirebaseAuth.instance.currentUser;
    return AppBar(
      backgroundColor: MyColours.bgColor,
      foregroundColor: Colors.white,
      centerTitle: true,
      title: Text(Values().appName),

      actionsPadding: EdgeInsets.symmetric(horizontal: 16.0),
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.menu,
          // color: MyColours.iconsColor
        ),
      ),

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

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const WishlistScreen()),
              );
            },
            icon: Icon(
              Icons.favorite_border,
              // color: MyColours.iconsColor,
            ),
          ),
        ),

        /*   IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WishlistScreen()),
            );
          },
          icon: Icon(
            Icons.favorite_border,
            // color: MyColours.iconsColor
          ),
        ),
*/
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
          icon: Icon(
            Icons.account_circle_outlined,
            // color: MyColours.iconsColor,
          ),
        ),
      ],
    );
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
