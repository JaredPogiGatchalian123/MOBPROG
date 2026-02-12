// lib/screens/games_screen.dart
import 'package:flutter/material.dart';
import '../widgets.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> games = [
      "Valorant",
      "Minecraft",
      "Wildrift",
      "MLBB",
      "Coc",
      "Roblox"
    ];

    // Map of game names to their logo URLs
    final Map<String, String> gameLogos = {
      "Valorant": "https://images.steamusercontent.com/ugc/1289667502762077035/0BBD690EF2F84B522A6E1D34EBE5F1513685C089/?imw=512&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false",
      "Minecraft": "https://i.imgur.com/nKsYRdJ.png",
      "Wildrift": "https://mir-s3-cdn-cf.behance.net/projects/404/25c91b145735295.Y3JvcCw2MTMsNDc5LDM5NCwxNg.jpg",
      "MLBB": "https://i.redd.it/6dfzkmk62l7e1.png",
      "Coc": "https://wallpapers.com/images/hd/clash-of-clans-gaming-logo-kzz4fawe3oakfjot.jpg",
      "Roblox": "https://upload.wikimedia.org/wikipedia/commons/7/7e/Roblox_Logo_2022.jpg",
    };

    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const SectionHeader(title: "Games I Play"),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15, childAspectRatio: 1.2),
              itemCount: games.length,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Game logo
                    Image.network(
                      gameLogos[games[index]]!,
                      width: 60, // uniform width
                      height: 60, // uniform height
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      games[index],
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
