import 'package:flutter/material.dart';

class AddCountryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;

  const AddCountryButton({
    super.key,
    this.onPressed,
    this.buttonText = 'Add Country',
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 650),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF45AEF0),
          foregroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }
}