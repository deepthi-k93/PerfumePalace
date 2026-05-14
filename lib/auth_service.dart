import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_entri/reuse_functions.dart';
class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  // static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// auth_services.dart
static Future<User?> register({
  required String name,
  required String email,
  required String phone,
  required String password,
}) async {
  try {
    // Create user with Firebase
    UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    
    User? user = result.user;
    if (user != null) {
      // Update display name
      await user.updateDisplayName(name);
      
      // Save to Firestore (optional)
      // await _saveUserToFirestore(user.uid, name, email, phone);
    }
    
    return user;
  } on FirebaseAuthException catch (e) {
    ReuseFunctions.logPrint().i('Firebase Auth Error: ${e.code}');
    rethrow;
  } catch (e) {
   ReuseFunctions.logPrint().i('Register Error: $e');
    rethrow;
  }
}

  /// LOGIN
  static Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      ReuseFunctions.logPrint().i("LOGIN ERROR: $e");
      return null;
    }
  }

  /// LOGOUT
  static Future<void> logout() async {
    await _auth.signOut();
  }
}