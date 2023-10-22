import 'package:flutter/material.dart';
import 'package:somobai/screens/home_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateSomobai extends StatefulWidget {
  const CreateSomobai({super.key});

  @override
  State<CreateSomobai> createState() => _CreateSomobaiState();
}

class _CreateSomobaiState extends State<CreateSomobai> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordObscured = true;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _passwordObscured = !_passwordObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Create Somobai',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Enter the somobai details',
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Somobai Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _passwordObscured,
                  decoration: InputDecoration(
                    labelText: 'Somobai Password',
                    suffixIcon: IconButton(
                      icon: Icon(_passwordObscured
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await FirebaseFirestore.instance
                          .collection('somobai')
                          .add({
                        'somobai_name': _nameController.text,
                        'password': _passwordController.text,
                      });

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeAdmin(),
                      ));
                    }
                  },
                  child: Text('Create Somobai'),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
