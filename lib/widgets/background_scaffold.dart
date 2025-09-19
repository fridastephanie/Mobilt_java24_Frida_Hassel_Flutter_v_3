import 'package:flutter/material.dart';

class BackgroundScaffold extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;

  const BackgroundScaffold({super.key, required this.child, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/background_sky.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }
}