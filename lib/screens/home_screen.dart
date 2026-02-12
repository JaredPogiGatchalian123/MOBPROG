import 'package:flutter/material.dart';
import '../widgets.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final String bio;
  final String email;

  const HomeScreen({
    super.key,
    required this.name,
    required this.bio,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const HeroImage(),
            const SizedBox(height: 30),

            const Text(
              "Welcome to my Personal Web!",
              style: TextStyle(
                color: Color(0xFFFF4D4D),
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Hi, my name is",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 50,
                color: Color(0xFFFF4D4D),
                fontWeight: FontWeight.w900,
                height: 1.1,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              email,
              style: const TextStyle(color: Colors.white38),
            ),

            const SizedBox(height: 20),

            Text(
              bio,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            // ✅ Buttons removed
          ],
        ),
      ),
    );
  }
}
