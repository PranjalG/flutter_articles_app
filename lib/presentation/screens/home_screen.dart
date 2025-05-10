import 'package:flutter/material.dart';
import 'package:flutter_article_app/presentation/screens/favourites_screen.dart';
import 'package:flutter_article_app/presentation/screens/landing_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const LandingScreen(),
    const FavouritesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: GoogleFonts.aBeeZee(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.blue[800],
        ),
        unselectedLabelStyle: GoogleFonts.aBeeZee(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Colors.blue[800],
        ),
        selectedIconTheme: const IconThemeData(
          size: 22,
        ),
        unselectedIconTheme: const IconThemeData(
          size: 18,
        ),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outlined),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
