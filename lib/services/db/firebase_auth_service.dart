import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class FirebaseAuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool initialized = false;
  late final StreamSubscription<User?> _sub;

  FirebaseAuthService() {
    _sub = _auth.authStateChanges().listen((u) {
      user = u;
      initialized = true;
      notifyListeners();
    });
  }

  bool get isLoggedIn => user != null;

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> signOutAndRedirect(BuildContext context) async {
    await signOut();
    if (context.mounted) {
      context.go('/login');
    }
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}