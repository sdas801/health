import 'package:flutter/material.dart';

class RechargeFailDialog extends StatefulWidget {
  const RechargeFailDialog({super.key});

  @override
  State<RechargeFailDialog> createState() => _RechargeFailDialogState();
}

class _RechargeFailDialogState extends State<RechargeFailDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      child: Container(
decoration: const BoxDecoration(
            color: Colors.white
          ),
              width: 400,
          padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 197, 32, 32),
                shape: BoxShape.circle,
      
              ),
              child: const Icon(Icons.priority_high, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 16),
            const Text(
              "Recharge Failed",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Your recharge was Failed of ₹5000, please try Again",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // handle view history
                    },
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey.shade400),

                        padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
                      
                    ),
                    child: const Text("Cancel", style: TextStyle(color: Colors.black, fontSize: 16,),),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                                              padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),

                      surfaceTintColor: Color.fromARGB(255, 197, 32, 32),
                      backgroundColor: Color.fromARGB(255, 197, 32, 32),
                      foregroundColor: Color.fromARGB(255, 197, 32, 32),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // close dialog
                    },
                    child: const Text("Retry Payment", style: TextStyle(color: Colors.white, fontSize: 16,),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}