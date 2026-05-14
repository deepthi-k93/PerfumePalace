import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_entri/theme/colors.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  Stream<QuerySnapshot> getWishlist(String userId) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("wishlist")
        .orderBy("createdAt", descending: true) // optional
        .snapshots();
  }

  Future<void> removeWishlistItem(String userId, String docId) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("wishlist")
        .doc(docId)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Scaffold(
        body: Center(child: Text("Please login first")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title:  Text("Wishlist"),
        backgroundColor: MyColours.bgColor,
        foregroundColor: Colors.white,
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: getWishlist(user.uid),
        builder: (context, snapshot) {

          //  Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          //  Error
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }

          final wishlist = snapshot.data!.docs;

          //  Empty
          if (wishlist.isEmpty) {
            return const Center(
              child: Text(
                "No items in wishlist yet ❤️",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: wishlist.length,
            itemBuilder: (context, index) {
              final item = wishlist[index];

              return Card(
                margin: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 6),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(

                  //  FIXED IMAGE
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      item["image"],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),

                  title: Text(
                    item["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  subtitle: Text(
                    "₹${item["price"]}",
                    style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColours.bgColor,
                    ),
                  ),

                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      removeWishlistItem(user.uid, item.id);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}