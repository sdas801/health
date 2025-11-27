import 'package:flutter/material.dart';
import '../screen/order_summary.dart';
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

  void _selectAmount(int amount) {
    setState(() {
      selectedAmount = amount;
      _amountController.text = amount.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width  = MediaQuery.of(context).size.width;
final height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar:width < 600 ?null:  PreferredSize(
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3D8C86),
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
              DecoratedBox(
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
                       Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                
                                width: double.infinity,
                                child: DecoratedBox(
                                  
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 255, 255, 255),
                                        Color.fromARGB(255, 198, 239, 245),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Text("Your Total Balance",
                                          style:
                                              TextStyle(color: Colors.grey)),
                                      SizedBox(height: 10),
                                      Text(
                                        "₹60,25,201",
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text("Active Plan",
                                            style: TextStyle(
                                                color: Colors.grey)),
                                        const SizedBox(height: 5),
                                        const Text("Premium - ₹1000/month",
                                            style: TextStyle(fontSize: 16)),
                                        const SizedBox(height: 20),
                              Divider(height: 10, color: Colors.grey.shade300),
                                        const SizedBox(height: 20),
      
                                        const Text("Renewal",
                                            style: TextStyle(
                                                color: Colors.grey)),
                                        const SizedBox(height: 5),
                                        const Text("15 Sep, 2025",
                                            style: TextStyle(fontSize: 16)),
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),


                      const SizedBox(height: 24),

                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropdownButtonFormField(
                              value: selectedPractice,
                              decoration: const InputDecoration(
                                labelText: "Practice Name",
                                border: OutlineInputBorder(),
                              ),
                              items: [
                                'Practice Name',
                                'Practice 2',
                                'Practice 3'
                              ]
                                  .map((e) => DropdownMenuItem(
                                      value: e, child: Text(e)))
                                  .toList(),
                              onChanged: (v) =>
                                  setState(() => selectedPractice = v!),
                            ),
                            const SizedBox(height: 25),
                            const Text("Recharge Amount",
                                style: TextStyle(fontSize: 16)),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 12,
                              children: amounts.map((e) {
                                return ChoiceChip(
                                  label: Text("₹ $e"),
                                  selected: selectedAmount == e,
                                  onSelected: (_) => _selectAmount(e),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: _amountController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter custom amount",
                              ),
                            ),
                            const SizedBox(height: 25),
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  backgroundColor: Colors.teal.shade600,
                                ),
                                onPressed: ()=>_showRechargeConfirmation(context),
                                child: const Text("Recharge Now",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                    ],
                  )
                  :Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //form fields
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropdownButtonFormField(
                              value: selectedPractice,
                              decoration: const InputDecoration(
                                labelText: "Practice Name",
                                border: OutlineInputBorder(),
                              ),
                              items: [
                                'Practice Name',
                                'Practice 2',
                                'Practice 3'
                              ]
                                  .map((e) => DropdownMenuItem(
                                      value: e, child: Text(e)))
                                  .toList(),
                              onChanged: (v) =>
                                  setState(() => selectedPractice = v!),
                            ),
                            const SizedBox(height: 25),
                            const Text("Recharge Amount",
                                style: TextStyle(fontSize: 16)),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 12,
                              children: amounts.map((e) {
                                return ChoiceChip(
                                  label: Text("₹ $e"),
                                  selected: selectedAmount == e,
                                  onSelected: (_) => _selectAmount(e),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: _amountController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter custom amount",
                              ),
                            ),
                            const SizedBox(height: 25),
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  backgroundColor: Colors.teal.shade600,
                                ),
                                onPressed: ()=>_showRechargeConfirmation(context),
                                child: const Text("Recharge Now",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
      
                      const SizedBox(width: 24),
      
                      //price container
                      Expanded(
                        
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                
                                width: double.infinity,
                                child: DecoratedBox(
                                  
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 255, 255, 255),
                                        Color.fromARGB(255, 198, 239, 245),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Text("Your Total Balance",
                                          style:
                                              TextStyle(color: Colors.grey)),
                                      SizedBox(height: 10),
                                      Text(
                                        "₹60,25,201",
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text("Active Plan",
                                            style: TextStyle(
                                                color: Colors.grey)),
                                        const SizedBox(height: 5),
                                        const Text("Premium - ₹1000/month",
                                            style: TextStyle(fontSize: 16)),
                                        const SizedBox(height: 20),
                              Divider(height: 10, color: Colors.grey.shade300),
                                        const SizedBox(height: 20),
      
                                        const Text("Renewal",
                                            style: TextStyle(
                                                color: Colors.grey)),
                                        const SizedBox(height: 5),
                                        const Text("15 Sep, 2025",
                                            style: TextStyle(fontSize: 16)),
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
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

void _showRechargeConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          width: 400,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  const SizedBox(width: 12),
                  const Text(
                    "Confirm Recharge",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Practice Name
              const Text(
                "Practice Name",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "PR - 12345",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              
              // Recharge Amount
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recharge Amount",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const Text(
                    "₹5000",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // GST
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "GST",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const Text(
                    "₹20",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              
              Divider(height: 32, thickness: 1),
              
              // Final Payable
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Final Payable",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "₹5020",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              
              // Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: Colors.grey.shade400),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const OrderSummary()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3D8C86),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Recharge Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}