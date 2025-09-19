import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'base_auth_vm.dart';

class RegisterViewModel extends BaseAuthViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<bool> register() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      setError('Passwords do not match');
      return false;
    }

    try {
      setLoading(true);
      setError(null);

      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      setLoading(false);
      return true;
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      if (e.code == 'email-already-in-use') {
        setError('An account with this email already exists');
      } else {
        setError('Something went wrong. Please try again.');
      }
      return false;
    } catch (e) {
      setLoading(false);
      setError('An error occurred. Please try again.');
      return false;
    }
  }
}