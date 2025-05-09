import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        // color: Colors.blue[200],
        // height: 40,
        // width: 80,
        // child: const Text("Card"),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
