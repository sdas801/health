import 'package:flutter/material.dart';
import 'package:my_app/src/screen/constants/recharge_form_mobile.dart';
import 'package:my_app/src/screen/transaction_history.dart';
import '../contants/preferred_size_app_bar.dart';
import 'constants/recharge_form.dart';
import 'constants/recharge_price.dart';

class RechargeScreen extends StatefulWidget {
  const RechargeScreen({super.key});

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  String selectedPractice = 'Practice Name';
  int selectedAmount = 500;

  final List<int> amounts = [500, 1000, 2000, 5000];

  @override
  void dispose() {
    _amountController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
// final height = MediaQuery.of(context).size.height;

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

          //main body coloumn
          child: Column(
            children: [
              //row widget
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Recharge
                  const Text(
                    "Recharge",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),

                  //View History botton
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const TransactionHistory()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 61, 140, 134),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      "View History",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
              
                    //main row
                    child: width < 600
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const RechargePrice(),
                              const SizedBox(height: 24),
                              RechargeFormMobile(
                                selectedPractice: selectedPractice,
                                selectedAmount: selectedAmount,
                                amounts: amounts,
                                amountController: _amountController,
                              ),
                            ],
                          )
                        : Row(
                          mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //form fields
                              Expanded(
                                child: RechargeForm(
                                  selectedPractice: selectedPractice,
                                  selectedAmount: selectedAmount,
                                  amounts: amounts,
                                  amountController: _amountController,
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
  }
}


