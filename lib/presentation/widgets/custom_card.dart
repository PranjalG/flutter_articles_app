import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final String displayTitle =
        title.length > 20 ? '${title.substring(0, 20)}...' : title;
    final String displaySubtitle =
        subtitle.length > 100 ? '${subtitle.substring(0, 100)}...' : subtitle;
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.blue[100],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: ListTile(
            title: Text(
              displayTitle,
              style: GoogleFonts.aBeeZee(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
            subtitle: Text(
              displaySubtitle,
              style: GoogleFonts.aBeeZee(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[900],
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        Positioned(
          top: 1,
          right: 8,
          child: IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? Colors.yellow[500] : Colors.grey,
              size: 28,
            ),
            onPressed: onFavoriteToggle,
          ),
        )
      ],
    );
  }
}
