import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TransactionSearch extends StatefulWidget {
  const TransactionSearch({super.key});

  @override
  State<TransactionSearch> createState() => _TransactionSearchState();
}

class _TransactionSearchState extends State<TransactionSearch> {
  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(
      builder:(context, constraints) {
        var width = constraints.maxWidth;
        
        return width <600 
        ? Column(
        children: [
          // Search box
          SizedBox(
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.white

              ),
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Search",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade800),
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
                color: Colors.white

                          ),
                          // ignore: prefer_const_constructors
                          child: Padding(
                          padding: const EdgeInsets.all(16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.alternate_email_outlined, size: 16),
                    SizedBox(width: 6),
                    Text("Sort", style: TextStyle(fontSize: 15)),
                    SizedBox(width: 6),
                    Icon(Icons.arrow_forward_ios, size: 14),
                  ],
                ),
                          ),
                        ),
              ),
          const SizedBox(width: 10,),
          
          // Filter Button
          Flexible(
            flex: 1,
            child: DecoratedBox(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.white
              ),
              child: const Padding(
                          padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Filter", style: TextStyle(fontSize: 15)),
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Search",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade800),
                ],
              ),
            ),
          ),
          
          const SizedBox(width: 10),
          
          // Sort Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Row(
              children: [
                Icon(Icons.alternate_email_outlined, size: 16),
                SizedBox(width: 6),
                Text("Sort", style: TextStyle(fontSize: 15)),
                SizedBox(width: 6),
                Icon(Icons.arrow_forward_ios, size: 14),
              ],
            ),
          ),
          
          const SizedBox(width: 10),
          
          // Filter Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Row(
              children: [
                Text("Filter", style: TextStyle(fontSize: 15)),
                SizedBox(width: 6),
                Icon(Icons.arrow_forward_ios, size: 14),
              ],
            ),
          ),
        ],
      );
      },
    );
  }
}