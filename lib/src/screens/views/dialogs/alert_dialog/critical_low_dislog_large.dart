import 'package:flutter/material.dart';

class CriticalLowDialogLarge extends StatefulWidget {
  const CriticalLowDialogLarge({super.key});

  @override
  State<CriticalLowDialogLarge> createState() => _CriticalLowDialogLargeState();
}

class _CriticalLowDialogLargeState extends State<CriticalLowDialogLarge> {
    late int selectedAmount = 500;
  late List<int> amounts = [500, 1000, 2000, 5000];

  void _selectAmount(int amount) {
    setState(() {
      selectedAmount = amount;
    });
  }

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
          
          decoration: const BoxDecoration(color: Colors.white,
          
          borderRadius: BorderRadius.all(Radius.circular(16)),
          
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                'Low Balance Alert',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Colors.red),
                  color: const Color.fromARGB(255, 253, 237, 236),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '₹-33.77',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Text(
                        'Your balance is critically low (₹-33.77). Access is restricted until you recharge',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Recharge Amount',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
          spacing: 12,
          children: amounts.map((e) {
            return ChoiceChip(
              
              label: Text("₹ $e"),
                    showCheckmark: false,
                    side: BorderSide.none,
                    backgroundColor: Colors.grey.shade300 ,
              selectedColor: const Color.fromARGB(255, 238, 252, 238),
              labelStyle: TextStyle(color: selectedAmount == e?  const Color.fromARGB(255, 61, 140, 134) : Colors.black),
              selected: selectedAmount == e,
              onSelected: (_) => _selectAmount(e),
            );
          }).toList(),
        ),
              const SizedBox(height: 16),
               TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey.shade300)
                    ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),

                     ),
                  
                  hintText: "Enter custom amount",
                ),
              ),
              const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: const Color.fromARGB(255, 61, 140, 134),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // close dialog
                    },
                    child: const Text(
                      "Recharge Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}