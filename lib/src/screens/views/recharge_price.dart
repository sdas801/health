import 'package:flutter/material.dart';

class RechargePrice extends StatefulWidget {
  const RechargePrice({super.key});

  @override
  State<RechargePrice> createState() => _RechargePriceState();
}

class _RechargePriceState extends State<RechargePrice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 176, 209, 206),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                
                children: [
                  SizedBox(height: 26,),
                  Text("Your Total Balance",
                      style: TextStyle(color: Color.fromARGB(255, 61, 140, 134),)),
                  SizedBox(height: 26,),

                  Text(
                    "₹60,25,201",
                    style: TextStyle(color: Color.fromARGB(255, 61, 140, 134),fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 26,),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Active Plan",
                        style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 5),
                    const Text("Premium - ₹1000/month",
                        style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 20),
                    Divider(height: 10, color: Colors.grey.shade300),
                    const SizedBox(height: 20),
                    const Text("Renewal", style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 5),
                    const Text("15 Sep, 2025", style: TextStyle(fontSize: 16)),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
