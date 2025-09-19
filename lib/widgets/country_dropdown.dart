import 'package:flutter/material.dart';
import '../viewmodels/add_country_vm.dart';

class CountryDropdown extends StatelessWidget {
  final AddCountryViewModel vm;
  const CountryDropdown({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 650),
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        value: vm.selectedCountryMap?['name'],
        hint: const Text('Select Country'),
        items: vm.countries
            .map((c) => DropdownMenuItem(
          value: c['name'],
          child: Text(c['name'] ?? ''),
        ))
            .toList(),
        onChanged: vm.setCountry,
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
