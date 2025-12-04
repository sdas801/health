import 'package:flutter/material.dart';
import 'package:my_app/src/screens/transaction_history.dart';
import '../contants/preferred_size_app_bar.dart';
import 'views/recharge_form/recharge_form_large.dart';
import 'views/recharge_form/recharge_form_small.dart';
import 'views/recharge_price.dart';

class RechargeScreen extends StatefulWidget {
  const RechargeScreen({super.key});

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  String selectedPractice = 'Practice Name';
  int selectedAmount = 500;

  final List<int> amounts = [500, 1000, 2000, 5000];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;
        return Scaffold(
          appBar: width < 600
              ? null
              : const PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: PreferredSizeAppBar()),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              //main body coloumn
              child: SizedBox(
                width: width,
                height: height,
                child: Column(
                  children: [
                    //row widget
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Recharge
                        Row(
                          children: [
                            width < 600
                                ? SizedBox( 
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey.shade300),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5))),
                                      child: const Icon(
                                        Icons.chevron_left,
                                        size: 20,
                                      ),
                                    ),
                                  )
                                : const Icon(
                                    Icons.chevron_left,
                                    size: 40,
                                  ),
                            
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                "Recharge",
                                style: TextStyle(
                                    fontSize: width < 600 ? 16 : 24,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                
                        //View History botton
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
                                horizontal: 28, vertical: width < 600 ? 16 : 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
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
                
                    const SizedBox(height: 20),
                
                    //white box container
                    Expanded(
                      flex: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: width< 600 ? Colors.transparent: Colors.white,
                          
                          borderRadius:
                              BorderRadius.circular(width < 600 ? 0 : 8),
                          border: Border.all(
                            color: width < 600
                                ? Colors.transparent
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(width < 600 ? 0 : 24),
                
                          //main row
                          child: width < 600
                              ? ListView(
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
                              : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //form fields
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
          ),
        );
      },
    );
  }
}
