import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:somobai/added_by_sifat/main_color.dart';

String? months;

//TabBarView 1st Page
class AddPayment extends StatefulWidget {
  String? messId;
  AddPayment({Key? key, this.messId}) : super(key: key);

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  String dropdownValue = '';
  List items = [];
  Map<String, dynamic> pushNotificationTokens = {};
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  String? selectedMonth;

  // List of month names
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  void initState() {
    super.initState();
    // Set the selected month to the first item in the list
    selectedMonth = months[0];
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // months = monthId;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Add Payment",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            backgroundColor: ColorIs.basicColor,
          ),
          body: SingleChildScrollView(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('members').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  for (int i = 0; i < documents.length; i++) {
                    if (items.length != documents.length) {
                      items.add((documents[i]["name"]));
                      // String name = documents[i]["name"];
                      // String token = documents[i]["push_token"];
                      // pushNotificationTokens[name] = token;
                    }
                  }
                }
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 16.0),
                      SizedBox(height: 16.0),
                      const SizedBox(height: 15),
                      const Row(
                        children: [
                          Text(
                            'Member Name',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            ' *',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          // iconEnabledColor: Colors.green[700],
                          // buttonHeight: 58,
                          isExpanded: true,
                          hint: const Text('Select a member'),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  ))
                              .toList(),
                          value: selectedValue,
                          // selectedItemHighlightColor: Colors.grey[300],
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Select Month',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            ' *',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedMonth,
                          items: months.map((String month) {
                            return DropdownMenuItem<String>(
                              value: month,
                              child: Text(month),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedMonth = newValue;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _amountController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(labelText: 'Enter Amount'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter valid amount';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 50.0,
                        width: 150.0,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    ColorIs.basicColor)),
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection('payments')
                                  .doc('$selectedValue')
                                  .collection('payment')
                                  .doc('$selectedMonth')
                                  .set({
                                'name': selectedValue,
                                'month': selectedMonth,
                                'amount': _amountController.text,
                              });

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Amount successfully added.'),
                              ));
                            },
                            child: Text('Add')),
                      ),
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }
}


/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Month Selection Dropdown'),
        ),
        body: MonthSelectionDropdown(),
      ),
    );
  }
}

class MonthSelectionDropdown extends StatefulWidget {
  @override
  _MonthSelectionDropdownState createState() => _MonthSelectionDropdownState();
}

class _MonthSelectionDropdownState extends State<MonthSelectionDropdown> {
  String selectedMonth;

  // List of month names
  List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'Selected Month: $selectedMonth',
            style: TextStyle(fontSize: 20),
          ),
          DropdownButton<String>(
            value: selectedMonth,
            items: months.map((String month) {
              return DropdownMenuItem<String>(
                value: month,
                child: Text(month),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                selectedMonth = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
*/