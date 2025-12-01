import 'package:flutter/material.dart';

class UpiTile extends StatefulWidget {
  final String name;
  final String upi;
  const UpiTile({super.key, required this.name, required this.upi});

  @override
  State<UpiTile> createState() => _UpiTileState();
}

class _UpiTileState extends State<UpiTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(
          'assets/images/phonepe.png',
        ),
      ),
      title: Text(widget.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(widget.upi),
      trailing: const Icon(Icons.check_circle_outline),
    );
  }
}