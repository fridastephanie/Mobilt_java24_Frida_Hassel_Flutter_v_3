import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/db/firebase_auth_service.dart';
import '../viewmodels/dashboard_vm.dart';
import 'package:go_router/go_router.dart';
import '../widgets/add_country_button.dart';
import '../widgets/app_header.dart';
import '../widgets/travel_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<FirebaseAuthService, DashboardViewModel>(
      builder: (context, authService, viewModel, _) {
        if (authService.isLoggedIn) {
          viewModel.init(authService.user!.uid);
        }

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
                  const AppHeader(
                    pageTitle: 'Your Travels',
                    imagePath: 'assets/airplane_header_image.png',
                  ),
                  const SizedBox(height: 14),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        await authService.signOutAndRedirect(context);
                      },
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: viewModel.travels.isEmpty
                        ? const Center(
                      child: Text(
                        'No travels added yet',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    )
                        : Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 16,
                      children: viewModel.travels
                          .map((travel) => TravelCard(travel: travel))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: AddCountryButton(
                      buttonText: 'Add New Country',
                      onPressed: () => context.go('/add-country'),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
