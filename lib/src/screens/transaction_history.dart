import 'package:flutter/material.dart';
import 'package:my_app/src/screens/views/transaction_search.dart';
import 'package:my_app/src/screens/views/transaction_tile.dart';

import '../contants/preferred_size_app_bar.dart';
import 'views/transaction_tile_mobile.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  final TextEditingController _searchController = TextEditingController();

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
              preferredSize: Size.fromHeight(65),
              child: PreferredSizeAppBar(
              ),
            ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Recharge
                  Text(
                    "Transaction History",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: width<600 ? Colors.transparent:Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: width<600 ? Colors.transparent:Colors.grey.shade300,
                    ),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(width<600? 0 :24),

                    //main row
                    child: width < 600
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const TransactionSearch(),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: 6,
                                    itemBuilder: (context, index) {
                                      return const TransactionTileMobile();
                                    }),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const TransactionSearch(),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: 6,
                                    itemBuilder: (context, index) {
                                      return const TransactionTile();
                                    }),
                              ),
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
