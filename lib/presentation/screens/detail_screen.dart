import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String subtitle;

  const DetailScreen({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Article Details",
          style: GoogleFonts.aBeeZee(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.deepPurple[900],
          ),
        ),
      ),
      body: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.deepPurple[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 40),
              Text(
                title,
                style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple[700],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                subtitle,
                style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.purple[900],
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
