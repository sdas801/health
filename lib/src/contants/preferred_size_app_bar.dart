import 'package:flutter/material.dart';

class PreferredSizeAppBar extends StatefulWidget {
  final TextEditingController searchController;
  
  const PreferredSizeAppBar({
    super.key, 
    required this.searchController,
  });

  @override
  State<PreferredSizeAppBar> createState() => _PreferredSizeAppBarState();
}

class _PreferredSizeAppBarState extends State<PreferredSizeAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.3),
          automaticallyImplyLeading: false,
          title: Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: TextField(
              controller: widget.searchController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: 'Search Patients by Name, Phone Number or Patient ID',
                prefixIcon: Icon(Icons.search),
                hintStyle: TextStyle(fontSize: 14),
                hoverColor: Colors.white,
              ),
            ),
          ),
          actions: const [
            Icon(Icons.notifications_none, color: Colors.black87, size: 28),
            SizedBox(width: 16),
            Icon(Icons.question_mark),
            SizedBox(width: 16),
            CircleAvatar(radius: 16),
            SizedBox(width: 8),
            Row(
              children: [
                Text("Rahul", style: TextStyle(color: Colors.black87)),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
            SizedBox(width: 20),
          ],
        ),
      );
  }
}