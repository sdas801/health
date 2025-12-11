import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/src/contants/preferred_size_app_bar.dart';
import 'package:my_app/src/pages/views/order_summary_widgets/payment_options.dart';
import 'package:my_app/src/pages/views/order_summary_widgets/recharge_qr.dart';

import 'views/dialogs/add_upi/add_new_upi_small.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  final String isSelected = 'UPI';
  String selectedWallet = '2';
  String selectedSavedUpi = 'amazon';
  @override
  void dispose() {
    super.dispose();
  }

  Widget _upiBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _box(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/bhim.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pay using any UPI app",
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  Text("Use any UPI app on the phone to pay",
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _appIcon("phonepe"),
              _appIcon("gpay"),
              _appIcon("paytm"),
              _appIcon("amazon_pay"),
            ],
          ),
          const SizedBox(height: 14),
          InkWell(
            onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: const AddNewUpiSmall())),
            child: const Row(
              children: [
                Icon(Icons.add_circle_outline, color: Colors.grey),
                SizedBox(width: 6),
                Text("Add New UPI ID",
                    style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardAddBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _box(),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/bhim.png',
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add New Card",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              Text("Visa, Mastercard, Rupay & more",
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _netBankingRow() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _box(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bankIcon("hdfc"),
          _bankIcon("icic"),
          _bankIcon("sbi"),
          _bankIcon("axis"),
        ],
      ),
    );
  }

  Widget _bankIcon(String name) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/${name}.png',
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(name, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _appIcon(String name) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/${name}.png',
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(name, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
      ),
    );
  }

  BoxDecoration _box() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobileScreen = width < 600;

    return isMobileScreen
        ? Scaffold(
            backgroundColor: Colors.grey.shade200,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                              child: const Icon(
                                Icons.chevron_left,
                                size: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Payment Methods",
                              style: TextStyle(
                                  fontSize: isMobileScreen ? 16 : 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// To Pay Section
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: const Text(
                      "To Pay: ₹5900",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 76, 155, 175)),
                    ),
                  ),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListView(
                          children: [
                            const SizedBox(height: 10),
                            _sectionTitle("Saved UPI ID"),
                            const SizedBox(height: 10),

                            /// Saved UPI List
                            PaymentRadioTile(
                              icon: 'assets/images/phonepe.png',
                              value: "1",
                              title: "PhonePe",
                              subtitle: "8794651256@ybl",
                              groupValue: selectedSavedUpi,
                              onChanged: (v) =>
                                  setState(() => selectedSavedUpi = v!),
                            ),
                            PaymentRadioTile(
                              icon: 'assets/images/phonepe.png',
                              value: "2",
                              title: "PhonePe",
                              subtitle: "8794651256@ybl",
                              groupValue: selectedSavedUpi,
                              onChanged: (v) =>
                                  setState(() => selectedSavedUpi = v!),
                            ),

                            const SizedBox(height: 10),
                            _sectionTitle("Pay UPI ID"),
                            const SizedBox(height: 10),

                            _upiBox(),

                            const SizedBox(height: 15),
                            _sectionTitle("Credit & Debit Cards"),
                            const SizedBox(height: 10),

                            _cardAddBox(),

                            const SizedBox(height: 15),
                            _sectionTitle("Net banking"),
                            const SizedBox(height: 10),

                            _netBankingRow(),

                            const SizedBox(height: 15),
                            _sectionTitle("Wallets"),
                            const SizedBox(height: 10),

                            /// Wallets — radio buttons
                            PaymentRadioTile(
                              icon: 'assets/images/phonepe.png',
                              value: "phonepe_wallet",
                              title: "PhonePe Wallet",
                              subtitle: "Balance: ₹7.99",
                              groupValue: selectedWallet,
                              onChanged: (v) =>
                                  setState(() => selectedWallet = v!),
                            ),
                            PaymentRadioTile(
                              icon: 'assets/images/amazon_pay.png',
                              value: "amazon",
                              title: "Amazon Pay Balance",
                              subtitle: "Balance: ₹7.99",
                              groupValue: selectedWallet,
                              onChanged: (v) =>
                                  setState(() => selectedWallet = v!),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        //large screen
        : Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(65),
                child: PreferredSizeAppBar()),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Column(
                  children: [
                    //heading - Amount
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(
                              Icons.chevron_left,
                              size: 40,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "OrderSummary",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Amount   :",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "₹5900",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),

                    //payment area
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Payment Methods",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PaymentOptions(
                                      isSelected: isSelected,
                                    ),
                                    const Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: RechargeQr(),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

class PaymentRadioTile extends StatefulWidget {
  final String icon;
  final String title;
  final String subtitle;
  final String value;
  final String groupValue;
  final Function(String?) onChanged;

  const PaymentRadioTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  State<PaymentRadioTile> createState() => _PaymentRadioTileState();
}

class _PaymentRadioTileState extends State<PaymentRadioTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  widget.icon,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(widget.subtitle,
                    style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
          ),
          Radio(
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}
