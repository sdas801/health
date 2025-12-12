import 'package:flutter/material.dart';
import 'dart:ui';
import '../show_recharge_confirmation/show_recharge_confirmation_large.dart';
import '../../../../contants/colors.dart';

class RechargeFormLarge extends StatefulWidget {
  final String selectedPractice;
  final List<int> amounts;
  final int selectedAmount;
  const RechargeFormLarge({
    super.key,
    required this.selectedPractice,
    required this.amounts,
    required this.selectedAmount,
  });

  @override
  State<RechargeFormLarge> createState() => _RechargeFormLargeState();
}

class _RechargeFormLargeState extends State<RechargeFormLarge> {
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;
        final double sizedboxHeight = height * 0.0333;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField(
              initialValue: selectedPractice,
              decoration: InputDecoration(
                labelText: "Practice Name",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              items: ['Practice Name', 'Practice 2', 'Practice 3']
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (v) => setState(() => selectedPractice = v!),
            ),
            SizedBox(height: 24),
            const Text("Recharge Amount", style: TextStyle(fontSize: 16)),
            SizedBox(height: 24),
            Row(
              children: amounts.map((e) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    // Makes the chip take full width
                    child: ChoiceChip(
                      label: Center(child: Text("₹ $e")),
                      showCheckmark: false,
                      side: BorderSide.none,
                      backgroundColor: Colors.grey.shade300,
                      selectedColor: const Color.fromARGB(255, 238, 252, 238),
                      labelStyle: TextStyle(
                        color: selectedAmount == e
                            ? const Color.fromARGB(255, 61, 140, 134)
                            : Colors.black,
                      ),
                      selected: selectedAmount == e,
                      onSelected: (_) => _selectAmount(e),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 24),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: "Enter custom amount",
              ),
            ),
            SizedBox(height: 24),

            //Recharge Now - Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: mainColor,
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
      },
    );
  }
}

void _showRechargeConfirmation(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.3),
    builder: (BuildContext context) {
      return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: const ShowRechargeConfirmationLarge());
    },
  );
}
