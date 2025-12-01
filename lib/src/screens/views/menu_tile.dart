import 'package:flutter/material.dart';

class MenuTile extends StatefulWidget {
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  const MenuTile({
    super.key,
    required this.title,
    this.isSelected = false,
    this.onTap,
  });

  @override
  State<MenuTile> createState() => _MenuTileState();
}

class _MenuTileState extends State<MenuTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap, // this makes it clickable
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: widget.isSelected
              ? const Color.fromARGB(255, 234, 252, 241)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color:
                widget.isSelected ? const Color.fromARGB(255, 21, 204, 143) : Colors.black,
          ),
        ),
      ),
    );
  }
}