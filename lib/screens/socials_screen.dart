import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets.dart';

class SocialsScreen extends StatelessWidget {
  const SocialsScreen({super.key});

  Future<void> _openLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> socials = [
      {
        "name": "Facebook",
        "icon": Icons.facebook,
        "url":
            "https://www.facebook.com/profile.php?id=61578265403283",
      },
      {
        "name": "Instagram",
        "icon": Icons.camera_alt,
        "url":
            "https://www.instagram.com/jaredchristian_10/",
      },
      {
        "name": "LinkedIn",
        "icon": Icons.work,
        "url":
            "https://www.linkedin.com/in/jared-christian-gatchalian-489b272a5/",
      },
      {
        "name": "GitHub",
        "icon": Icons.code,
        "url":
            "https://github.com/JaredPogiGatchalian123",
      },
      {
        "name": "Discord",
        "icon": Icons.discord,
        "url":
            "https://discordapp.com/users/541224688387358741",
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const SectionHeader(title: "Connect With Me!"),
          Expanded(
            child: ListView.builder(
              itemCount: socials.length,
              itemBuilder: (context, index) {
                final item = socials[index];

                return Card(
                  color: Colors.white.withOpacity(0.05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: Icon(
                      item["icon"],
                      color: const Color(0xFFFF4D4D),
                    ),
                    title: Text(
                      item["name"],
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.white54,
                    ),
                    onTap: () => _openLink(item["url"]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
