import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'base_auth_vm.dart';

class LoginViewModel extends BaseAuthViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<bool> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      setLoading(true);
      setError(null);

      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      setLoading(false);
      return true;
    } on FirebaseAuthException {
      setLoading(false);
      setError('Incorrect username or password');
      return false;
    } catch (e) {
      setLoading(false);
      setError('An error occurred. Please try again.');
      return false;
    }
  }
}