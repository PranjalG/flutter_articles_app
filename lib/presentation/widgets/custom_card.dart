import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Card(
        color: Colors.blue[100],
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
