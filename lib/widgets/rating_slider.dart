import 'package:flutter/material.dart';
import '../viewmodels/add_country_vm.dart';

class RatingSlider extends StatelessWidget {
  final AddCountryViewModel vm;
  const RatingSlider({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 650),
      child: Row(
        children: [
          const Text('Rating: '),
          Expanded(
            child: Slider(
              value: vm.rating.toDouble(),
              min: 1,
              max: 5,
              divisions: 4,
              activeColor: const Color(0xFF45AEF0),
              inactiveColor: Colors.black26,
              label: '${vm.rating}',
              onChanged: (val) => vm.setRating(val.toInt()),
            ),
          ),
        ],
      ),
    );
  }
}