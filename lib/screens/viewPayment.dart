import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:somobai/screens/paymentDetail.dart';
import 'package:somobai/screens/payment_option.dart';

int? year;

//TabBarView 1st Page
class ViewPayment extends StatefulWidget {
  String? messId;
  ViewPayment({Key? key, this.messId}) : super(key: key);

  @override
  State<ViewPayment> createState() => _ViewPaymentState();
}

class _ViewPaymentState extends State<ViewPayment> {
  String dropdownValue = '';
  List items = [];
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  String? selectedYear;

  // List of month names
  List<String> year = [
    '2025',
    '2024',
    '2023',
    '2022',
    '2021',
    '2020',
  ];

  @override
  void initState() {
    super.initState();
    // Set the selected month to the first item in the list
    selectedYear = year[0];
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('members').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  Text('View Payment',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
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
                      value: selectedYear,
                      items: year.map((String year) {
                        return DropdownMenuItem<String>(
                          value: year,
                          child: Text(year),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedYear = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PaymentDetail(name: selectedValue ?? ''),
                            ));
                      },
                      child: Text('Submit')),
                ],
              ),
            );
          },
        ),
      )),
    );
  }
}
