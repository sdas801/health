import 'package:flutter/material.dart';

class UpiTile extends StatefulWidget {
  final String icon;
  final String title;
  final String subtitle;
  final String value;
  final String groupValue;
  final Function(String?) onChanged;

  const UpiTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

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
              widget.icon,
            ),
          ),
        ),
      ),
      title: Text(widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(widget.subtitle),
      trailing: Radio(
        value: widget.value,
        groupValue: widget.groupValue,
        onChanged: widget.onChanged,
      ),
    );
  }
}
