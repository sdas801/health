import 'package:flutter/material.dart';
import 'package:my_app/src/contants/preferred_size_app_bar.dart';
import 'package:my_app/src/screen/constants/payment_options.dart';
import 'package:my_app/src/screen/constants/recharge_qr.dart';


class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  final TextEditingController _searchController = TextEditingController();
  String isSelected = 'UPI';
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: width < 600
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(65),
              child: PreferredSizeAppBar(
                controller: _searchController,
              )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              //row widget
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "OrderSummary",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Amount   :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "₹5900",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              //payment area
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: width < 600
                      ? Column(
                          children: [
                            RechargeQr(pageWidth: width),
                            const SizedBox(
                              height: 24,
                            ),
                            PaymentOptions(isSelected: isSelected,)
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PaymentOptions(isSelected: isSelected,),
                            
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: RechargeQr(pageWidth: width),
                              ),
                            )
                          ],
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
