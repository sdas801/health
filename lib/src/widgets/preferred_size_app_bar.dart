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
      shadowColor: Colors.green.withAlpha(38),
      automaticallyImplyLeading: false,
      title: const SizedBox(
        height: 45,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: 'Search Patients by Name, Phone Number or Patient ID',
                isDense: true,
                contentPadding: EdgeInsets.zero,
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
          Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: DecoratedBox(decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade200,
                ),child: const Center(child: Icon(Icons.person_2_rounded)))),
              ),

            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Rahul", style: TextStyle(color: Colors.black87)),
            Text('+91123445666(Beta)'),
              
            ]),
              Icon(Icons.arrow_drop_down),

          ],
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
