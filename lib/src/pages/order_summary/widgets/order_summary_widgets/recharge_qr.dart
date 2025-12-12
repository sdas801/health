import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import '../add_upi/add_new_upi_large.dart';
import '../../../recharge/widgets/recharge_dialog/recharge_fail_dialog_large.dart';
import '../../../recharge/widgets/recharge_dialog/recharge_fail_dialog_small.dart';
import '../../../recharge/widgets/recharge_dialog/recharge_success_dialog_large.dart';
import '../../../recharge/widgets/recharge_dialog/recharge_success_dialog_small.dart';
import 'upi_tile.dart';

class RechargeQr extends StatefulWidget {
  // final double pageWidth;
  const RechargeQr({
    super.key,
  });

  @override
  State<RechargeQr> createState() => _RechargeQrState();
}

class _RechargeQrState extends State<RechargeQr> {
  String selectedSavedUpi = "2";

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        // final double height = constraints.maxHeight;
        final bool isMobileScreen = width < 600;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // QR
            Stack(
              children: [
                Positioned.fill(
                  child: InkWell(
                    onTap: () => isMobileScreen
                        ? showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: const RechargeFailDialogSmall()),
                          )
                        : _showFailDialog(context),
                    child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.transparent)),
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () => isMobileScreen
                        ? showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: const RechargeSuccessDialogSmall()),
                          )
                        : _showSuccessDialog(context),
                    child: SizedBox(
                      height: 120,
                      width: 120,
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
            const Text('Scan QR and Pay', style: TextStyle(fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(60),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/phonepe.png"),
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(60),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/gpay.png"),
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(60),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/paytm.png"),
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(60),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/cred.jpeg"),
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(60),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/amazon_pay.png"),
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                    ),
                  ),
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
                      text: "09:26",
                      style: TextStyle(fontWeight: FontWeight.bold))
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

            Divider(
              color: Colors.grey.shade300,
            ),

            const SizedBox(height: 10),

            UpiTile(
              icon: 'assets/images/phonepe.png',
              title: "PhonePe",
              subtitle: "8978451256@ybl",
              value: '1',
              groupValue: selectedSavedUpi,
              onChanged: (v) => setState(() => selectedSavedUpi = v!),
            ),
            UpiTile(
              icon: 'assets/images/phonepe.png',
              title: "PhonePe",
              subtitle: "8978451256@ybl",
              value: '2',
              groupValue: selectedSavedUpi,
              onChanged: (v) => setState(() => selectedSavedUpi = v!),
            ),

            const SizedBox(height: 30),
            InkWell(
              onTap: () => _showAddNewUpiDialog(context),
              child: const Row(
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10),
                  Text("Pay Using UPI ID", style: TextStyle(fontSize: 15))
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.3),
    builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: const RechargeSuccessDialog()),
  );
}

void _showFailDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.3),
    builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: const RechargeFailDialog()),
  );
}

void _showAddNewUpiDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.3),
    builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: const AddNewUpiLarge()),
  );
}
