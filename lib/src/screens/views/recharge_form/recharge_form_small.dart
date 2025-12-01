import 'package:flutter/material.dart';

import '../dialogs/show_recharge_confirmation/show_recharge_confirmation_small.dart';

class RechargeFormSmall extends StatefulWidget {
  final String selectedPractice;
  final List<int> amounts;
  final int selectedAmount;

  const RechargeFormSmall({
    super.key,
    required this.selectedPractice,
    required this.amounts,
    required this.selectedAmount,
    
    });

  @override
  State<RechargeFormSmall> createState() => _RechargeFormSmallState();
}

class _RechargeFormSmallState extends State<RechargeFormSmall> {
  late String selectedPractice;
  late List<int> amounts;
  late int selectedAmount;

@override
  void dispose() {
    super.dispose();
  }

@override
  void initState() {
    super.initState();
    selectedPractice = widget.selectedPractice;
    amounts = widget.amounts;
    selectedAmount = widget.selectedAmount;
  }

void _selectAmount(int amount) {
    setState(() {
      selectedAmount = amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField(
          value: selectedPractice,
          decoration:  InputDecoration(
            labelText: "Practice Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          items: ['Practice Name', 'Practice 2', 'Practice 3']
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (v) => setState(() => selectedPractice = v!),
        ),
        const SizedBox(height: 25),
        const Text("Recharge Amount", style: TextStyle(fontSize: 16)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          children: amounts.map((e) {
            return ChoiceChip(
              
              label: Text("₹ $e"),
                    showCheckmark: false,
                    side: BorderSide.none,
                    backgroundColor: Colors.grey.shade300 ,
              selectedColor: Color.fromARGB(255, 238, 252, 238),
              labelStyle: TextStyle(color: selectedAmount == e?  const Color.fromARGB(255, 61, 140, 134) : Colors.black),
              selected: selectedAmount == e,
              onSelected: (_) => _selectAmount(e),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        const TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            
            hintText: "Enter custom amount",
          ),
        ),
        const SizedBox(height: 25),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.teal.shade600,
            ),
            onPressed: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const ShowRechargeConfirmationSmall(),
                  ),
            child: const Text("Recharge Now",
                style: TextStyle(fontSize: 16, color: Colors.white),),
          ),
        ),
      ],
    );
  }
}
