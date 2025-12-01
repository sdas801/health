import 'package:flutter/material.dart';

import 'dialogs/recharge_dialog/recharge_fail_dialog_large.dart';
import 'dialogs/recharge_dialog/recharge_fail_dialog_small.dart';
import 'dialogs/recharge_dialog/recharge_success_dialog_large.dart';
import 'dialogs/recharge_dialog/recharge_success_dialog_small.dart';
import 'upi_tile.dart';

class RechargeQr extends StatefulWidget {
  final double pageWidth;
  const RechargeQr({super.key, required this.pageWidth});

  @override
  State<RechargeQr> createState() => _RechargeQrState();
}

class _RechargeQrState extends State<RechargeQr> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40),

        // QR
        Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () => width < 600 ? showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const RechargeFailDialogSmall(),
                  ):_showFailDialog(context),
                child: Container(color: Colors.transparent),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () => width < 600 ? showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const RechargeSuccessDialogSmall(),
                  ):_showSuccessDialog(context),
                child: SizedBox(
                  height: widget.pageWidth < 600 ? 150 : 200,
                  width: widget.pageWidth < 600 ? 150 : 200,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/qr.png"),
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(60),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/phonepe.png"),
                    fit: BoxFit.fitWidth,
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(60),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/gpay.png"),
                    fit: BoxFit.fitWidth,
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(60),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/paytm.png"),
                    fit: BoxFit.fitWidth,
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(60),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/cred.jpeg"),
                    fit: BoxFit.fitWidth,
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(60),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/amazon_pay.png"),
                    fit: BoxFit.fitWidth,
                  )),
            )
          ],
        ),
        const SizedBox(height: 12),
        const Text("Scan QR and Pay",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),

        const SizedBox(height: 8),
        const Text(
            "Scan the QR using any UPI app on your phone\nPhonePe • Gpay • Paytm • CRED • AmazonPay • BHIM",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.black54)),

        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 10),

        const Text.rich(
          TextSpan(
            text: "Approve payment within: ",
            children: [
              TextSpan(
                  text: "09:26", style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ),

        const SizedBox(height: 25),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text("Saved UPI ID",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),

        const UpiTile(name: "PhonePe", upi: "8978451256@ybl"),
        const UpiTile(name: "PhonePe", upi: "8978451256@ybl"),

        const SizedBox(height: 10),
        const Row(
          children: [
            Icon(
              Icons.add_circle_outline,
              color: Colors.grey,
            ),
            SizedBox(width: 10),
            Text("Pay Using UPI ID", style: TextStyle(fontSize: 15))
          ],
        ),
      ],
    );
  }
}

void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const RechargeSuccessDialog(),
  );
}

void _showFailDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const RechargeFailDialog(),
  );
}
