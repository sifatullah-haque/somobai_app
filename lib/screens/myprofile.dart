import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:somobai/added_by_sifat/main_color.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String? _gender;
  final TextEditingController _nidNumberController = TextEditingController();
  File? _nidBackPicture;
  File? _profilePicture;

  void _selectImage(ImageSource source, Function(File) setImage) async {
    final image = await ImagePicker().getImage(source: source);
    if (image != null) {
      setImage(File(image.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Profile', style: TextStyle(fontSize: 20.0)),
          centerTitle: true,
          backgroundColor: ColorIs.basicColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 16.0),
                  Text('Enter Your Somobai Profile Details',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                  // SizedBox(height: 16.0),
                  // Text('Gender'),
                  // RadioListTile<String>(
                  //   title: Text('Male'),
                  //   value: 'Male',
                  //   groupValue: _gender,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _gender = value;
                  //     });
                  //   },
                  // ),
                  // RadioListTile<String>(
                  //   title: Text('Female'),
                  //   value: 'Female',
                  //   groupValue: _gender,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _gender = value;
                  //     });
                  //   },
                  // ),
                  // RadioListTile<String>(
                  //   title: Text('Others'),
                  //   value: 'Others',
                  //   groupValue: _gender,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _gender = value;
                  //     });
                  //   },
                  // ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _nidNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: 'NID Number'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your NID number';
                      } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                        return 'Invalid mobile number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    height: 50.0,
                    width: 150.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(ColorIs.basicColor)),
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
                            content: Text('Profile Info Added'),
                          ));

                          // Perform the action when the form is valid.
                          // Access the form data and images here.
                        }
                      },
                      child: Text('Update', style: TextStyle(fontSize: 15.0)),
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
