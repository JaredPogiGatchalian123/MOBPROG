import 'package:flutter/material.dart';

class TechStackScreen extends StatelessWidget {
  const TechStackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Tech stack data (updated logos, no description)
    final List<Map<String, String>> tools = [
      {
        "name": "HTML",
        "logo": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/1280px-HTML5_logo_and_wordmark.svg.png"
      },
      {
        "name": "CSS",
        "logo": "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/CSS3_logo_and_wordmark.svg/960px-CSS3_logo_and_wordmark.svg.png"
      },
      {
        "name": "PYTHON",
        "logo": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkBKGzgKHQA42GTo40DCQUnNVkUWd3FMzFJA&s"
      },
      {
        "name": "Flutter",
        "logo": "https://storage.googleapis.com/cms-storage-bucket/lockup_flutter_vertical.a9d6ce81aee44ae017ee.png"
      },
      {
        "name": "MYSQL",
        "logo": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrLIsoAHea-BOhRzeFAqp8P9OChYR2Fch6mQ&s"
      },
      {
        "name": "OutSystems",
        "logo": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ554zVuSKGygz1sPpFJalHnK_SVHUiFNwqig&s"
      },
      {
        "name": "Microsoft PowerApps",
        "logo": "https://www.openskydata.com/hubfs/Power%20Apps%20Logo%20Featured%20Image%20sized%20canvas%20%28720%20%C3%97%20400%20px%29.png"
      },
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Tech Skills",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1, // taller items to prevent overlap
                ),
                itemCount: tools.length,
                itemBuilder: (context, index) {
                  final tool = tools[index];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          tool["logo"]!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          tool["name"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
