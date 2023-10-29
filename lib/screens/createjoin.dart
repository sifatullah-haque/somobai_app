import 'package:flutter/material.dart';
import 'package:somobai/screens/createsomobai.dart';
import 'package:somobai/screens/joinsomobai.dart';

class CreateJoin extends StatelessWidget {
  const CreateJoin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                width: 150,
              ),
              SizedBox(
                height: 50.0,
              ),
              SizedBox(
                height: 50.0,
                width: 200.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateSomobai(),
                        ));
                  },
                  child: Text('Create Somobai'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50.0,
                width: 200.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JoinSomobai(),
                        ));
                  },
                  child: Text('Join Somobai'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
