import 'package:flutter/material.dart';

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
    final width  = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar:width < 600 ?null: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.3),
          automaticallyImplyLeading: false,
          title: Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: 'Search Patients by Name, Phone Number or Patient ID',
                prefixIcon: Icon(Icons.search),
                hintStyle: TextStyle(fontSize: 14),
                hoverColor: Colors.white,
              ),
            ),
          ),
          actions: const [
            Icon(Icons.notifications_none, color: Colors.black87, size: 28),
            SizedBox(width: 16),
            Icon(Icons.question_mark),
            SizedBox(width: 16),
            CircleAvatar(radius: 16),
            SizedBox(width: 8),
            Row(
              children: [
                Text("Rahul", style: TextStyle(color: Colors.black87)),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              //row widget
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "OrderSummary",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Amount   :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "₹5900",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              //payment area
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:width < 600 
                ? Column(
                  children: [
                    Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 40),
              
                            // QR
                            Container(
                              height: width < 600 ? 100 : 180,
                              width: width < 600 ? 100 : 180,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/qr.png"),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(60),
                                      image: DecorationImage(
                                        image:
                                            AssetImage("assets/images/phonepe.png"),
                                        fit: BoxFit.fitWidth,
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(60),
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/gpay.png"),
                                        fit: BoxFit.fitWidth,
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(60),
                                      image: DecorationImage(
                                        image:
                                            AssetImage("assets/images/paytm.png"),
                                        fit: BoxFit.fitWidth,
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(60),
                                      image: DecorationImage(
                                        image:
                                            AssetImage("assets/images/cred.jpeg"),
                                        fit: BoxFit.fitWidth,
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(60),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/amazon_pay.png"),
                                        fit: BoxFit.fitWidth,
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Text("Scan QR and Pay",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
              
                            const SizedBox(height: 8),
                            const Text(
                                "Scan the QR using any UPI app on your phone\nPhonePe • Gpay • Paytm • CRED • AmazonPay • BHIM",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 13, color: Colors.black54)),
              
                            const SizedBox(height: 20),
                            const Divider(),
                            const SizedBox(height: 10),
              
                            const Text.rich(
                              TextSpan(
                                text: "Approve payment within: ",
                                children: [
                                  TextSpan(
                                      text: "09:26",
                                      style: TextStyle(fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
              
                            const SizedBox(height: 25),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: const Text("Saved UPI ID",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(height: 10),
              
                            const UpiTile(name: "PhonePe", upi: "8978451256@ybl"),
                            const UpiTile(name: "PhonePe", upi: "8978451256@ybl"),
              
                            const SizedBox(height: 10),
                            Row(
                              children: const [
                                Icon(Icons.add_circle_outline, color: Colors.grey,),
                                SizedBox(width: 10),
                                Text("Pay Using UPI ID",
                                    style: TextStyle(fontSize: 15))
                              ],
                            ),
                          ],
                        ),
      
                        SizedBox(height: 24,),
      
                        Container(
                      decoration: BoxDecoration(
                      color: Colors.white,
                        border: Border(right: BorderSide(color: Colors.grey.shade300,width:1, ))
                      ),
                      width: 220,
                      padding:
                          const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Payment Methods",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 30),
                          
                          MenuTile(title: "UPI", isSelected: isSelected == 'UPI', onTap: (){
                            setState(() {
                              isSelected = 'UPI';
                            });
                          },),
                          MenuTile(title: "Credit / Debit Card",isSelected: isSelected == 'Credit / Debit Card', onTap: () {
                            setState(() {
                              isSelected = 'Credit / Debit Card';
                            });
                          },),
                          MenuTile(title: "Wallets",isSelected: isSelected == 'Wallets', onTap: () {
                            setState(() {
                              isSelected = 'Wallets';
                            });
                          },),
                          MenuTile(title: "Net banking",isSelected: isSelected == 'Net banking', onTap: () {
                            setState(() {
                              isSelected = 'Net banking';
                            });
                          },
                          ),
                        ],
                      ),
                    ),
      
                  ],
                )
                : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                      color: Colors.white,
                        border: Border(right: BorderSide(color: Colors.grey.shade300,width:1, ))
                      ),
                      width: 220,
                      padding:
                          const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Payment Methods",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 30),
                          MenuTile(title: "UPI", isSelected: isSelected == 'UPI', onTap: (){
                            setState(() {
                              isSelected = 'UPI';
                            });
                          },),
                          MenuTile(title: "Credit / Debit Card",isSelected: isSelected == 'Credit / Debit Card', onTap: () {
                            setState(() {
                              isSelected = 'Credit / Debit Card';
                            });
                          },),
                          MenuTile(title: "Wallets",isSelected: isSelected == 'Wallets', onTap: () {
                            setState(() {
                              isSelected = 'Wallets';
                            });
                          },),
                          MenuTile(title: "Net banking",isSelected: isSelected == 'Net banking', onTap: () {
                            setState(() {
                              isSelected = 'Net banking';
                            });
                          },
                          ),
                        ],
                      ),
                    ),
                    
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 40),
              
                            // QR
                            Container(
                              height: 180,
                              width: 180,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/qr.png"),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(60),
                                      image: DecorationImage(
                                        image:
                                            AssetImage("assets/images/phonepe.png"),
                                        fit: BoxFit.fitWidth,
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(60),
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/gpay.png"),
                                        fit: BoxFit.fitWidth,
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(60),
                                      image: DecorationImage(
                                        image:
                                            AssetImage("assets/images/paytm.png"),
                                        fit: BoxFit.fitWidth,
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(60),
                                      image: DecorationImage(
                                        image:
                                            AssetImage("assets/images/cred.jpeg"),
                                        fit: BoxFit.fitWidth,
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(60),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/amazon_pay.png"),
                                        fit: BoxFit.fitWidth,
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Text("Scan QR and Pay",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
              
                            const SizedBox(height: 8),
                            const Text(
                                "Scan the QR using any UPI app on your phone\nPhonePe • Gpay • Paytm • CRED • AmazonPay • BHIM",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 13, color: Colors.black54)),
              
                            const SizedBox(height: 20),
                            const Divider(),
                            const SizedBox(height: 10),
              
                            const Text.rich(
                              TextSpan(
                                text: "Approve payment within: ",
                                children: [
                                  TextSpan(
                                      text: "09:26",
                                      style: TextStyle(fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
              
                            const SizedBox(height: 25),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: const Text("Saved UPI ID",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(height: 10),
              
                            const UpiTile(name: "PhonePe", upi: "8978451256@ybl"),
                            const UpiTile(name: "PhonePe", upi: "8978451256@ybl"),
              
                            const SizedBox(height: 10),
                            Row(
                              children: const [
                                Icon(Icons.add_circle_outline, color: Colors.grey,),
                                SizedBox(width: 10),
                                Text("Pay Using UPI ID",
                                    style: TextStyle(fontSize: 15))
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// left side menu vertical menu
class MenuTile extends StatelessWidget {
   final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  const MenuTile({
    super.key,
    required this.title,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // this makes it clickable
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          
          color: isSelected ? Color.fromARGB(255, 234, 252, 241) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: isSelected ? Color.fromARGB(255, 21, 204, 143) : Colors.black,
          ),
        ),
      ),
    );
  }
}

// save upi tile
class UpiTile extends StatelessWidget {
  final String name;
  final String upi;
  const UpiTile({super.key, required this.name, required this.upi});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        
        radius: 20,
        backgroundImage: AssetImage('assets/images/phonepe.png', ),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(upi),
      trailing: const Icon(Icons.check_circle_outline),
    );
  }
}
