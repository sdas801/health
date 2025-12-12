import 'package:flutter/material.dart';

class TransactionSearch extends StatelessWidget {
  const TransactionSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final bool isMobileScreen = width < 600;
        return isMobileScreen
            ? Column(
                children: [
                  // Search box
                  SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade300),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 14),
                        child: Row(
                          children: [
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    hintText: 'Search',
                                    hintStyle: TextStyle(fontSize: 16),
                                    border: InputBorder.none),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black87),
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down,
                                color: Colors.grey.shade800),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300),
                              color: Colors.white),
                          // ignore: prefer_const_constructors
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.alternate_email_outlined, size: 16),
                                SizedBox(width: 6),
                                Text("Sort", style: TextStyle(fontSize: 16)),
                                SizedBox(width: 6),
                                Icon(Icons.arrow_forward_ios, size: 14),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),

                      // Filter Button
                      Flexible(
                        flex: 1,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300),
                              color: Colors.white),
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Filter", style: TextStyle(fontSize: 16)),
                                SizedBox(width: 6),
                                Icon(Icons.arrow_forward_ios, size: 14),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                  // Sort Button
                ],
              )
            : Row(
                children: [
                  // Search box
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 14),
                        child: Row(
                          children: [
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    hintText: 'Search',
                                    hintStyle: TextStyle(fontSize: 16),
                                    border: InputBorder.none),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black87),
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down,
                                color: Colors.grey.shade800),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Sort Button
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Row(
                        children: [
                          Icon(Icons.alternate_email_outlined, size: 16),
                          SizedBox(width: 6),
                          Text("Sort", style: TextStyle(fontSize: 16)),
                          SizedBox(width: 6),
                          Icon(Icons.arrow_forward_ios, size: 14),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Filter Button
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      child: Row(
                        children: [
                          Text("Filter", style: TextStyle(fontSize: 16)),
                          SizedBox(width: 6),
                          Icon(Icons.arrow_forward_ios, size: 14),
                        ],
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
