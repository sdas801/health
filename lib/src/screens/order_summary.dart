import 'package:flutter/material.dart';
import 'package:my_app/src/contants/preferred_size_app_bar.dart';
import 'package:my_app/src/screens/views/payment_options.dart';
import 'package:my_app/src/screens/views/recharge_qr.dart';

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
          : const PreferredSize(
              preferredSize: Size.fromHeight(65), child: PreferredSizeAppBar()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: LayoutBuilder(
            builder: (context, constraints) {
              var width = constraints.maxWidth;
              return ListView(
                children: [
                  //row widget
                   Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        width < 600
                            ? GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: SizedBox(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5))),
                                    child: const Icon(
                                      Icons.chevron_left,
                                      size: 20,
                                    ),
                                  ),
                                ),
                            )
                            : GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: const Icon(
                                  Icons.chevron_left,
                                  size: 40,
                                ),
                            ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child:  Text(
                            "OrderSummary",
                            style: TextStyle(
                                fontSize: width < 600 ? 16 :20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                         Text(
                          "Amount   :",
                          style: TextStyle(
                              fontSize:width < 600 ? 16 : 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                         Text(
                          "₹5900",
                          style: TextStyle(
                              fontSize:width<600 ? 16 : 20, fontWeight: FontWeight.w600),
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
                      child: width < 600 
                          ? Column(
                              children: [
                                const RechargeQr(),
                                const SizedBox(
                                  height: 24,
                                ),
                                PaymentOptions(
                                  isSelected: isSelected,
                                )
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.all(20.0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
