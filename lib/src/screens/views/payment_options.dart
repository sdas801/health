import 'package:flutter/material.dart';

import 'menu_tile.dart';

class PaymentOptions extends StatefulWidget {
  final String isSelected;

  const PaymentOptions({super.key, required this.isSelected});

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  late String isSelected;
  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: 220,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            right: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MenuTile(
            title: "UPI",
            isSelected: isSelected == 'UPI',
            onTap: () {
              setState(() {
                isSelected = 'UPI';
              });
            },
          ),
          MenuTile(
            title: "Credit / Debit Card",
            isSelected: isSelected == 'Credit / Debit Card',
            onTap: () {
              setState(() {
                isSelected = 'Credit / Debit Card';
              });
            },
          ),
          MenuTile(
            title: "Wallets",
            isSelected: isSelected == 'Wallets',
            onTap: () {
              setState(() {
                isSelected = 'Wallets';
              });
            },
          ),
          MenuTile(
            title: "Net banking",
            isSelected: isSelected == 'Net banking',
            onTap: () {
              setState(() {
                isSelected = 'Net banking';
              });
            },
          ),
        ],
      ),
    ),
          );
  }
}
