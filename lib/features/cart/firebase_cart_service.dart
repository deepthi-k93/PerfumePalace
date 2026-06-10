import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_entri/reuse_functions.dart';

class FirebaseCartService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ADD TO CART
  static Future<void> addToCart(
    String userId,
    Map<String, dynamic> product,
  ) async {
    await _db.collection("users").doc(userId).collection("cart").add({
      "name": product["name"],
      "price": product["offer_price"],
      "image": product["image"],
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  // GET CART
  static Stream<QuerySnapshot> getCart(String userId) {
    return _db
        .collection("users")
        .doc(userId)
        .collection("cart")
        .orderBy("createdAt", descending: true)
        .snapshots();
  }

  // DELETE SINGLE ITEM
  static Future<void> deleteItem(String userId, String docId) async {
    await _db
        .collection("users")
        .doc(userId)
        .collection("cart")
        .doc(docId)
        .delete();
  }

  // CLEAR ENTIRE CART (FIXED)
  static Future<void> clearCart(String userId) async {
    final snapshot = await _db
        .collection("users")
        .doc(userId)
        .collection("cart")
        .get();

    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  //get cart count
  Stream<int> getCartCount(String userId) {
    return _db
        .collection("users")
        .doc(userId)
        .collection('cart')
        .orderBy("createdAt", descending: true)
        .snapshots()
        .map((snapshot) {
          int totalCount = snapshot.docs.length;

          return totalCount;
        });
  }
}
