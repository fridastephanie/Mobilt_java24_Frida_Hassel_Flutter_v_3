import 'package:flutter/material.dart';
import '../viewmodels/add_country_vm.dart';

class DatePickerRow extends StatelessWidget {
  final AddCountryViewModel vm;
  final Future<void> Function(BuildContext, bool, AddCountryViewModel) pickDate;

  const DatePickerRow({super.key, required this.vm, required this.pickDate});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 650),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF45AEF0),
                foregroundColor: Colors.white,
              ),
              onPressed: () => pickDate(context, true, vm),
              child: Text(
                'From: ${vm.fromDate != null ? vm.fromDate!.toLocal().toString().split(' ')[0] : 'Select'}',
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF45AEF0),
                foregroundColor: Colors.white,
              ),
              onPressed: () => pickDate(context, false, vm),
              child: Text(
                'To: ${vm.toDate != null ? vm.toDate!.toLocal().toString().split(' ')[0] : 'Select'}',
              ),
            ),
          ),
        ],
      ),
    );
  }
}