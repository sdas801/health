import 'package:flutter/material.dart';

class AddNewUpiSmall extends StatefulWidget {
  const AddNewUpiSmall({super.key});

  @override
  State<AddNewUpiSmall> createState() => _AddNewUpiSmallState();
}

class _AddNewUpiSmallState extends State<AddNewUpiSmall> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add New UPI",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close, size: 22),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                // UPI TextField
                TextField(
                  decoration: InputDecoration(
                    labelText: "UPI ID",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                ),

                SizedBox(height: 16),

                Text(
                  "A collect request will be sent to this UPI ID",
                  style: TextStyle(fontSize: 14),
                ),

                SizedBox(height: 12),

                // Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (v) {},
                    ),
                    Expanded(
                      child: Text(
                        "Securely save my UPI ID for future use",
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 20),

                // Bottom button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: null, // disabled state look
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: Colors.grey.shade300,
                      foregroundColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text("Verify & Pay ₹5900"),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
