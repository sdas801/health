import 'package:flutter/material.dart';

class PreferredSizeAppBar extends StatelessWidget {
  const PreferredSizeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.3),
      automaticallyImplyLeading: false,
      title: const SizedBox(
        height: 45,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
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
        ),
      ),
      actions: [
        const Icon(Icons.notifications_none, color: Colors.black87, size: 28),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: VerticalDivider(
            color: Colors.grey.shade300,
            thickness: 1.0,
            width: 1,
          ),
        ),
        const Icon(
          Icons.help_outline,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: VerticalDivider(
            color: Colors.grey.shade300,
            thickness: 1.0,
            width: 1,
          ),
        ),
         const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Center(child: Icon(Icons.person_2_rounded)),
              Text("Rahul", style: TextStyle(color: Colors.black87)),
              Icon(Icons.keyboard_arrow_down),
            ]),
            Text('+91123445666(Beta)'),
          ],
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
