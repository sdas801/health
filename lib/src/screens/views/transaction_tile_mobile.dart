import 'package:flutter/material.dart';

class TransactionTileMobile extends StatefulWidget {
  const TransactionTileMobile({super.key});

  @override
  State<TransactionTileMobile> createState() => _TransactionTileMobileState();
}

class _TransactionTileMobileState extends State<TransactionTileMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),

      child: Column(
        children: [
          Row(
            children: [

              // Icon Circle
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_circle_up, color: Colors.green, size: 22),
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

              
              
            ],
          ),
          const SizedBox(height: 12),

          Container(
            width: double.infinity,
            alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Invoice",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 76, 175, 150),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}