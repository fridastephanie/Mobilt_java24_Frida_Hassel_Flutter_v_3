import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:uppgift4_travel_journal/viewmodels/register_vm.dart';
import 'package:uppgift4_travel_journal/widgets/form_fields.dart';
import '../widgets/app_header.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
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
                      pageTitle: 'Register',
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
                            const SizedBox(height: 12),
                            PasswordField(
                              controller: viewModel.confirmPasswordController,
                              label: "Confirm Password",
                            ),
                            const SizedBox(height: 20),
                            viewModel.isLoading
                                ? const CircularProgressIndicator()
                                : ElevatedButton(
                              onPressed: () async {
                                final success = await viewModel.register();
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
                              child: const Text('Register'),
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: () {
                                context.go('/login');
                              },
                              child: const Text("Already have an account? Login"),
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