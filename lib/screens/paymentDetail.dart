import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PaymentDetail extends StatefulWidget {
  final String name;
  const PaymentDetail({super.key, required this.name});

  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('${widget.name}'),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('payments')
                    .doc('${widget.name}')
                    .collection('payment')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Display a loading indicator.
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (!snapshot.hasData) {
                    return Text('No data available');
                  }

                  // Access the documents and extract the 'amount' field.
                  final documents = snapshot.data!.docs;
                  List<String> amounts =
                      documents.map((doc) => doc['amount'].toString()).toList();

                  // Now, you can use the 'amounts' list to display the data in your Flutter widget.
                  return ListView.builder(
                    itemCount: amounts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Amount: ${amounts[index]}'),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
