import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseOrderService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // PLACE ORDER
  static Future<void> placeOrder({
    required String userId,
    required double total,
    required List<Map<String, dynamic>> items,
  }) async {
    await _db
        .collection("users")
        .doc(userId)
        .collection("orders")
        .add({
      "total": total,
      "items": items,
      "date": FieldValue.serverTimestamp(), 
    });
  }

  //GET ORDERS
  static Stream<QuerySnapshot> getOrders(String userId) {
    return _db
        .collection("users")
        .doc(userId)
        .collection("orders")
        .orderBy("date", descending: true)
        .snapshots();
  }
}