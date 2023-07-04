import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<String?> getCurrentUserId() async {
    User? user = currentUser;
    if (user != null) {
      return user.uid;
    }
    return null;
  }

  Future<void> registerUser(
      String username,
      String email,
      String password,
      String repeatpassword,
      ) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update user profile with additional details
      await userCredential.user!.updateDisplayName(username);

      // Save additional user details to Firestore or other database
      // Example: Saving to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'username': username,
        'email': email,
      });

      print('User registered: ${userCredential.user!.uid}');
    } on FirebaseAuthException catch (e) {
      print('Failed to register user: $e');
      // Handle registration errors
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Sign in failed: $e');
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Sign out failed: $e');
    }
  }
}