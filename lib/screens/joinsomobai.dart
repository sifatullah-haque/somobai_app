import 'package:flutter/material.dart';
import 'package:somobai/added_by_sifat/main_color.dart';

class JoinSomobai extends StatefulWidget {
  const JoinSomobai({super.key});

  @override
  State<JoinSomobai> createState() => _JoinSomobaiState();
}

class _JoinSomobaiState extends State<JoinSomobai> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordObscured = true;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();

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
                Image.asset(
                  "assets/logo.png",
                  width: 120.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text('Join Somobai',
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
                TextFormField(
                  controller: _mobileNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'Mobile Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a mobile number';
                    } else if (!RegExp(r'^\d{10}$').hasMatch(value!)) {
                      return 'Invalid mobile number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                SizedBox(
                  height: 50.0,
                  width: 200.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(ColorIs.basicColor)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Perform the action when the form is valid.
                        // You can access the name and password using _nameController.text and _passwordController.text.
                        // Replace this with your actual logic.
                      }
                    },
                    child: Text(
                      'Join Somobai',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
