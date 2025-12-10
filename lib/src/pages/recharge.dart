import 'package:flutter/material.dart';
import 'package:my_app/src/pages/transaction_history.dart';
import '../contants/preferred_size_app_bar.dart';
import 'views/recharge_form/recharge_form_large.dart';
import 'views/recharge_form/recharge_form_small.dart';
import 'views/recharge_price.dart';

class RechargeScreen extends StatelessWidget {
  const RechargeScreen({super.key});

  final String selectedPractice = 'Practice Name';

  final int selectedAmount = 500;

  final List<int> amounts = const [500, 1000, 2000, 5000];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final bool isMobileScreen = width < 600;
        final bool isTabScreen = width < 1024;
        return Scaffold(
          appBar: isMobileScreen
              ? null
              : const PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: PreferredSizeAppBar()),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  //Recharge and View-history Heading
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //heading Widget - Recharge
                      Row(
                        children: [
                          isMobileScreen
                              ? DecoratedBox(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5))),
                                  child: const Icon(
                                    Icons.chevron_left,
                                    size: 20,
                                  ),
                                )
                              : const Icon(
                                  Icons.chevron_left,
                                  size: 40,
                                ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Recharge",
                              style: TextStyle(
                                  fontSize: isMobileScreen ? 16 : 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),

                      //Trailing widget - View History
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TransactionHistory()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 61, 140, 134),
                          padding: EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: isMobileScreen ? 16 : 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 2,
                        ),
                        child: const Text(
                          "View History",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  //Payment container
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color:
                            isMobileScreen ? Colors.transparent : Colors.white,
                        borderRadius:
                            BorderRadius.circular(isMobileScreen ? 0 : 8),
                        border: Border.all(
                          color: isMobileScreen
                              ? Colors.transparent
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(isMobileScreen ? 0 : 24),

                        //Payment
                        child: isMobileScreen
                            ? Column(
                                children: [
                                  const RechargePrice(),
                                  const SizedBox(height: 24),
                                  RechargeFormSmall(
                                    selectedPractice: selectedPractice,
                                    selectedAmount: selectedAmount,
                                    amounts: amounts,
                                  ),
                                ],
                              )
                            : isTabScreen
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //price container
                                      const Expanded(child: RechargePrice()),

                                      const SizedBox(width: 24),

                                      //form fields container

                                      Expanded(
                                        child: RechargeFormLarge(
                                          selectedPractice: selectedPractice,
                                          selectedAmount: selectedAmount,
                                          amounts: amounts,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //form fields container
                                      Expanded(
                                        child: RechargeFormLarge(
                                          selectedPractice: selectedPractice,
                                          selectedAmount: selectedAmount,
                                          amounts: amounts,
                                        ),
                                      ),
                                      const SizedBox(width: 24),

                                      //price container
                                      const Expanded(child: RechargePrice()),
                                    ],
                                  ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
