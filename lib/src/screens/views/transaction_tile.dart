import 'package:flutter/material.dart';

class TransactionTile extends StatefulWidget {
  const TransactionTile({super.key});

  @override
  State<TransactionTile> createState() => _TransactionTileState();
}

class _TransactionTileState extends State<TransactionTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade200),
        ),
      
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
                
              // Icon Circle
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.green.withAlpha(38),
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                padding: EdgeInsets.all(10),
                  child: Icon(Icons.arrow_circle_up, color: Colors.green, size: 22),
                ),
              ),
                
              const SizedBox(width: 12),
                
              // Text Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Account Recharge",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "04 APR, 03:25 PM • UPI",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
                
              // Amount
              const Text(
                "+₹1500",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
                
              const SizedBox(width: 12),
                
              // Invoice Button
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    "Invoice",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}