import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../contants/colors.dart';

class RechargePrice extends StatelessWidget {
  const RechargePrice({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double height = constraints.maxHeight;
        final double width = constraints.maxWidth;
        const double gap = 24;
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade300,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(255, 176, 209, 206),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: SizedBox(
                      height: 142,
                      child: Padding(
                        padding: EdgeInsets.all(gap),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Your Total Balance",
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 16,
                                )),
                            Text(
                              "₹60,25,201",
                              style: TextStyle(
                                  color: mainColor,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(gap),
                child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          height: 66,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Active Plan",
                                  style: TextStyle(color: textGrey)),
                              Text("Premium - ₹1000/month",
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Divider(height: 1, color: Colors.grey.shade300),
                        const SizedBox(height: 24),
                        const SizedBox(
                          width: double.infinity,
                          height: 66,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Renewal",
                                  style: TextStyle(color: textGrey)),
                              Text("15 Sep, 2025",
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        );
      },
    );
  }
}
