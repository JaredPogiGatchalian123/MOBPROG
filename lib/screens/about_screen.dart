import 'package:flutter/material.dart';
import '../widgets.dart';
import 'edit_profile_screen.dart';

class AboutScreen extends StatelessWidget {
  final String currentName;
  final String currentBio;
  final String currentEmail;
  final Function(String, String, String) onSave;

  const AboutScreen({
    super.key, 
    required this.currentName, 
    required this.currentBio, 
    required this.currentEmail, 
    required this.onSave
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SectionHeader(title: "About Me"),
              IconButton(
                icon: const Icon(Icons.edit, color: Color(0xFFFF4D4D), size: 30),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(
                        currentName: currentName,
                        currentBio: currentBio,
                        currentEmail: currentEmail,
                        onSave: onSave,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          _buildInfoCard("🎓", "Education", "BSIT (2nd Year)\nAsia Pacific College\nExpected: 2028"),
          _buildInfoCard("💡", "Fun Fact", "Favorite color is red & black. Animal lover with 4 dogs and 3 cats!"),
          _buildInfoCard("🎨", "Hobbies", "Gaming, music, movies, TikTok, and staying active at the gym."),
          _buildInfoCard("🚀", "Dream", "To become a successful IT professional and live a happy, comfortable life."),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String emoji, String title, String body) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text(emoji, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 10),
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFFF4D4D))),
          ]),
          const SizedBox(height: 10),
          Text(body, style: const TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}