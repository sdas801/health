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
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        height: 50,
        width: 50,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/phonepe.png',
            ),
          ),
        ),
      ),
      title: Text(widget.name,
          style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(widget.upi),
      trailing: const Icon(Icons.check_circle_outline),
    );
  }
}
