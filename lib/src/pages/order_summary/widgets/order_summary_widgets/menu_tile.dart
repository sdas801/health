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
      child: SizedBox(
        width: double.infinity,
        
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(right: BorderSide(color: Colors.grey.shade300)),
          color: widget.isSelected
              ? const Color(0xFFF1F6EE)
              : Colors.transparent,
        ),
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),

            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color:
                    widget.isSelected ? const Color(0xFF57AEA6) : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}