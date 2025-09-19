import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/db/firebase_auth_service.dart';
import '../viewmodels/add_country_vm.dart';
import '../viewmodels/dashboard_vm.dart';
import '../widgets/app_header.dart';
import '../widgets/country_dropdown.dart';
import '../widgets/date_picker_row.dart';
import '../widgets/rating_slider.dart';
import '../widgets/add_country_button.dart';
import 'package:go_router/go_router.dart';

class AddCountryPage extends StatelessWidget {
  const AddCountryPage({super.key});

  Future<void> pickDate(
      BuildContext context, bool isFrom, AddCountryViewModel vm) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: const Color(0xFF45AEF0),
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
        ),
        child: child!,
      ),
    );

    if (newDate != null) {
      isFrom ? vm.setFromDate(newDate) : vm.setToDate(newDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dashboardVm = context.read<DashboardViewModel>();

    return ChangeNotifierProvider(
      create: (_) => AddCountryViewModel(),
      child: Consumer<AddCountryViewModel>(
        builder: (context, vm, _) => Scaffold(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppHeader(
                      pageTitle: 'Add New Country',
                      imagePath: 'assets/airplane_header_image.png'),
                  const SizedBox(height: 16),

                  Center(
                    child: ElevatedButton(
                      onPressed: () => context.go('/dashboard'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Go Back'),
                    ),
                  ),
                  const SizedBox(height: 16),

                  vm.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : vm.errorMessage != null
                      ? Center(child: Text(vm.errorMessage!))
                      : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CountryDropdown(vm: vm),
                        const SizedBox(height: 12),
                        DatePickerRow(vm: vm, pickDate: pickDate),
                        const SizedBox(height: 12),
                        RatingSlider(vm: vm),
                        const SizedBox(height: 20),
                        AddCountryButton(
                          onPressed: () async {
                            if (!vm.validateFields()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please fill all fields')),
                              );
                              return;
                            }
                            final travel = vm.createTravel();
                            final userId = context.read<FirebaseAuthService>().user!.uid;
                            await dashboardVm.addTravel(travel, userId);
                            context.go('/dashboard');
                          },
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
