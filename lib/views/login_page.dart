import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:uppgift4_travel_journal/viewmodels/login_vm.dart';
import 'package:uppgift4_travel_journal/widgets/form_fields.dart';
import '../widgets/app_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background_sky.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppHeader(
                      pageTitle: 'Login',
                      imagePath: 'assets/airplane_header_image.png',
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            EmailField(controller: viewModel.emailController),
                            const SizedBox(height: 12),
                            PasswordField(controller: viewModel.passwordController),
                            const SizedBox(height: 20),
                            viewModel.isLoading
                                ? const CircularProgressIndicator()
                                : ElevatedButton(
                              onPressed: () async {
                                final success = await viewModel.login();
                                if (success) {
                                  context.go('/dashboard');
                                } else if (viewModel.errorMessage != null) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text(viewModel.errorMessage!),
                                    ),
                                  );
                                }
                              },
                              child: const Text('Login'),
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: () {
                                context.go('/register');
                              },
                              child: const Text("Don't have an account? Register"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}