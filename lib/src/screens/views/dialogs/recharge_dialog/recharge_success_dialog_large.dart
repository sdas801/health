import 'package:flutter/material.dart';
import 'package:my_app/src/screens/transaction_history.dart';

import '../alert_dialog/low_balance_dialog_large.dart';

class RechargeSuccessDialog extends StatefulWidget {
  const RechargeSuccessDialog({super.key});

  @override
  State<RechargeSuccessDialog> createState() => _RechargeSuccessDialogState();
}

class _RechargeSuccessDialogState extends State<RechargeSuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      child: SizedBox(

              width: 400,

        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                
                  ),
                  child: Padding(
                  padding: EdgeInsets.all(24),
                    child: Icon(Icons.check, color: Colors.white, size: 40),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Recharge Successful",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Your recharge was Successful of ₹5000 was credited to your wallet",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const TransactionHistory()));
                        },
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey.shade400),
                  
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
                          
                        ),
                        child: const Text("View History",style: TextStyle(color: Colors.black, fontSize: 16,), ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                  
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
                          backgroundColor: const Color.fromARGB(255, 61, 140, 134),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const LowBalanceDialogLarge()));
                          
                        },
                        child: const Text("Continue",  style: TextStyle(color: Colors.white,fontSize: 16,),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}