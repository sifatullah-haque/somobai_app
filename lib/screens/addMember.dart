import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddMember extends StatefulWidget {
  const AddMember({super.key});

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _nidNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Add Member"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 16.0),
                  Text('Enter your somobai member details',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _fullNameController,
                    decoration: InputDecoration(labelText: 'Full Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _mobileNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: 'Mobile Number'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your mobile number';
                      } else if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                        return 'Invalid mobile number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _emailAddressController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Mail Address'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email address';
                      } else if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                          .hasMatch(value)) {
                        return 'Invalid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _nidNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: 'NID Number'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your NID number';
                      }
                      // else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      //   return 'Invalid NID number';
                      // }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    height: 50.0,
                    width: 150.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await FirebaseFirestore.instance
                              .collection('members')
                              .doc('${_mobileNumberController.text}')
                              .set({
                            'name': _fullNameController.text,
                            'mobile': _mobileNumberController.text,
                            'mail': _emailAddressController.text,
                            'nid': _nidNumberController.text,
                          });

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('New Member Added'),
                          ));

                          // Perform the action when the form is valid.
                          // Access the form data and images here.
                        }
                      },
                      child: Text('Add'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
