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
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        return Scaffold(
          appBar: width < 600
              ? null
              : const PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: PreferredSizeAppBar(),
                ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        width < 600
                            ? GestureDetector(
                              onTap: ()=>Navigator.of(context).pop(),
                              child: SizedBox(
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
                            )
                            : GestureDetector(
                              onTap: ()=>Navigator.of(context).pop(),
                              child: const Icon(
                                  Icons.chevron_left,
                                  size: 40,
                                ),
                            ),
                        const SizedBox(
                              width: 15,
                            ),
                        //Recharge
                        Text(
                          "Transaction History",
                          style: TextStyle(
                              fontSize: width < 600 ? 16 : 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ), 
                  Expanded(
                    flex: 1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: width < 600 ? Colors.transparent : Colors.white,
                        borderRadius: BorderRadius.circular(8),
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
      },
    );
  }
}
