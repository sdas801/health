import 'package:flutter/material.dart';
import 'package:my_app/src/pages/transaction_history/widgets/transaction_search.dart';
import 'package:my_app/src/pages/transaction_history/widgets/transaction_tile/transaction_tile.dart';

import '../../widgets/preferred_size_app_bar.dart';
import 'widgets/transaction_tile/transaction_tile_mobile.dart';

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
        final double width = constraints.maxWidth;
        final bool isMobileScreen = width < 600;
        return Scaffold(
          appBar: isMobileScreen
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
                        isMobileScreen
                            ? InkWell(
                                onTap: () => Navigator.of(context).pop(),
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
                              )
                            : InkWell(
                                onTap: () => Navigator.of(context).pop(),
                                child: const Icon(
                                  Icons.chevron_left,
                                  size: 40,
                                ),
                              ),
                        const SizedBox(
                          width: 15,
                        ),
                        //Header - Transaction History
                        Text(
                          "Transaction History",
                          style: TextStyle(
                              fontSize: isMobileScreen ? 16 : 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),

                  //body container
                  Expanded(
                    flex: 1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color:
                            isMobileScreen ? Colors.transparent : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isMobileScreen
                              ? Colors.transparent
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(isMobileScreen ? 0 : 24),
                        child: isMobileScreen
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
