import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String pageTitle;
  final String imagePath;

  const AppHeader({
    super.key,
    required this.pageTitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 12),
              Text(
                'Travel Journal',
                style: const TextStyle(
                  fontSize: 36,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
              shadows: [
                Shadow(
                  blurRadius: 0,
                  color: Colors.white,
                  offset: Offset(1, 0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 680,
              ),
              child: AspectRatio(
                aspectRatio: 15 / 5,
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            pageTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: [
                Shadow(
                  blurRadius: 0,
                  color: Colors.white,
                  offset: Offset(1, 0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}