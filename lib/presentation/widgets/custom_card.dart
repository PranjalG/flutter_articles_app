import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final String displaySubtitle =
        subtitle.length > 100 ? '${subtitle.substring(0, 100)}...' : subtitle;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Card(
        color: Colors.blue[100],
        child: ListTile(
          title: Text(
            title,
            style: GoogleFonts.aBeeZee(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          subtitle: Text(
            displaySubtitle,
            style:  GoogleFonts.aBeeZee(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey[900],
          ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
