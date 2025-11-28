import 'package:flutter/material.dart';

import 'show_recharge_confirmation.dart';

class RechargeForm extends StatefulWidget {
  final String selectedPractice;
  final List<int> amounts;
  final int selectedAmount;
  final TextEditingController amountController;
  const RechargeForm({
    super.key,
    required this.selectedPractice,
    required this.amounts,
    required this.selectedAmount,
    required this.amountController,
  });

  @override
  State<RechargeForm> createState() => _RechargeFormState();
}

class _RechargeFormState extends State<RechargeForm> {
  late String selectedPractice;
  late List<int> amounts;
  late int selectedAmount;
  late TextEditingController amountController;
  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    selectedPractice = widget.selectedPractice;
    amounts = widget.amounts;
    selectedAmount = widget.selectedAmount;
    amountController = widget.amountController;
  }

  void _selectAmount(int amount) {
    setState(() {
      selectedAmount = amount;
      amountController.text = amount.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField(
          value: selectedPractice,
          decoration: const InputDecoration(
            labelText: "Practice Name",
            border: OutlineInputBorder(),
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
              selected: selectedAmount == e,
              onSelected: (_) => _selectAmount(e),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
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
            onPressed: () {
                _showRechargeConfirmation(context);

            },
                
            child: const Text("Recharge Now",
                style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ),
      ],
    );
  }
}

void _showRechargeConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const ShowRechargeConfirmation();
    },
  );
}
