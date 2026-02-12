import 'package:flutter/material.dart';
import 'dart:math' as math;

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Text(title, 
        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: Color(0xFFFF4D4D))),
    );
  }
}

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 2 * math.pi),
          duration: const Duration(seconds: 5),
          builder: (context, double value, child) {
            return Transform.translate(
              offset: Offset(0, 10 * math.sin(value)),
              child: child,
            );
          },
          child: Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFFF4D4D), width: 4),
              boxShadow: [
                BoxShadow(color: const Color(0xFFFF4D4D).withOpacity(0.4), blurRadius: 40, spreadRadius: 5),
              ],
            ),
            child: const CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  "https://media.licdn.com/dms/image/v2/D5603AQE4UAbnN8MXXA/profile-displayphoto-crop_800_800/B56ZqnLOF0G4AM-/0/1763741328312?e=1771459200&v=beta&t=fOhbvHoBmXvzwrEVnL5-qRlgsW_8Dh3zztudluKqt50"),
            ),
          ),
        ),
      ],
    );
  }
}