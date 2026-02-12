import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Ensure this package is in pubspec.yaml
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/games_screen.dart';
import 'screens/friends_list_screen.dart';
import 'screens/socials_screen.dart';
import 'screens/tech_stack_screen.dart'; // <- Added this

// 1. Initialize Supabase before running the app
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Your actual Supabase credentials
  await Supabase.initialize(
    url: 'https://ulxisdqvlsbixtjkqhuw.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVseGlzZHF2bHNiaXh0amtxaHV3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzA4MzM0MDYsImV4cCI6MjA4NjQwOTQwNn0.JUK5DqPuS6GQA0Bj6yB4VSsRTgiTnT5lZH6aMzCtyMs',
  );

  runApp(const JaredPortfolioApp());
}

// 2. Global variable to use the Supabase client in any file
final supabase = Supabase.instance.client;

class JaredPortfolioApp extends StatelessWidget {
  const JaredPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Space | Jared Christian',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF050505),
        primaryColor: const Color(0xFFFF4D4D),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFF4D4D),
          secondary: Color(0xFFFF4D4D),
        ),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  // Student Profile Data
  String userName = "Jared Christian M. Gatchalian";
  String userBio = "Welcome to my personal space on the internet, where I share my projects, passions, and everything I’m working on. Feel free to explore and connect with me!";
  String userEmail = "jmgatchalian@student.apc.edu.ph";

  void _updateProfile(String name, String bio, String email) {
    setState(() {
      userName = name;
      userBio = bio;
      userEmail = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      HomeScreen(name: userName, bio: userBio, email: userEmail),
      AboutScreen(
        currentName: userName, 
        currentBio: userBio, 
        currentEmail: userEmail, 
        onSave: _updateProfile,
      ),
      const GamesScreen(),
      const FriendsListScreen(),
      const SocialsScreen(),
      TechStackScreen(), // <- Removed const here
    ];

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFF4D4D).withOpacity(0.12),
              ),
            ),
          ),
          PageView(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            children: _screens,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        },
        backgroundColor: const Color(0xFF050505),
        selectedItemColor: const Color(0xFFFF4D4D),
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.videogame_asset), label: 'Games'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Friends'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Socials'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Tech'), // <- Tech Stack
        ],
      ),
    );
  }
}
