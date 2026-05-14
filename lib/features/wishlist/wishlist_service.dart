import 'package:cloud_firestore/cloud_firestore.dart';

class WishlistService { 
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// ADD TO WISHLIST
  static Future<void> addToWishlist(
      String userId, Map<String, dynamic> product) async {
    try {
      await _firestore
          .collection("users")
          .doc(userId)
          .collection("wishlist")
          .doc(product["id"]) //  ALWAYS use ID
          .set({
        ...product,
        "createdAt": FieldValue.serverTimestamp(), // optional
      });
    } catch (e) {
      print("ADD WISHLIST ERROR: $e");
    }
  }

  /// REMOVE FROM WISHLIST
  static Future<void> removeFromWishlist(
      String userId, String productId) async {
    try {
      await _firestore
          .collection("users")
          .doc(userId)
          .collection("wishlist")
          .doc(productId)
          .delete();
    } catch (e) {
      print("REMOVE WISHLIST ERROR: $e");
    }
  }

  /// GET WISHLIST (STREAM)
  static Stream<QuerySnapshot> getWishlist(String userId) {
    return _firestore
        .collection("users")
        .doc(userId)
        .collection("wishlist")
        .orderBy("createdAt", descending: true)
        .snapshots();
  }

  /// CHECK IF WISHLIST (ONE TIME)
  static Future<bool> isWishlist(String userId, String productId) async {
    try {
      final doc = await _firestore
          .collection("users")
          .doc(userId)
          .collection("wishlist")
          .doc(productId)
          .get();

      return doc.exists;
    } catch (e) {
      print("CHECK WISHLIST ERROR: $e");
      return false;
    }
  }
}