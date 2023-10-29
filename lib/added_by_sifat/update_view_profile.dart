import 'package:flutter/material.dart';
import 'package:somobai/screens/addMember.dart';

class UpdateViewProfile extends StatelessWidget {
  const UpdateViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My profile"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.0,
                width: 200.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddMember()));
                  },
                  child: Text("Update"),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 50.0,
                width: 200.0,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("View Profile"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
