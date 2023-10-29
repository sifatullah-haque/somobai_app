import 'package:flutter/material.dart';
import 'package:somobai/added_by_sifat/main_color.dart';
import 'package:somobai/added_by_sifat/update_view_profile.dart';
import 'package:somobai/screens/mymember.dart';
import 'package:somobai/screens/myprofile.dart';
import 'package:somobai/screens/payment_option.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          leading: const Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage("assets/joy.jpg"),
            ),
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Abdullah joy"),
              Text(
                "Somobai Rich",
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu_rounded,
                  size: 35.0,
                ))
          ],
          backgroundColor: ColorIs.basicColor,
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => UpdateViewProfile()),
                          ),
                        );
                      },
                      child: const Column(
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            size: 100.0,
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(fontSize: 15.0),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 50.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => MyMember()),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.people,
                            size: 100.0,
                          ),
                          Text(
                            "Member",
                            style: TextStyle(fontSize: 15.0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => PaymentOptions()),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.payments_outlined,
                        size: 100.0,
                      ),
                      Text(
                        "Payments",
                        style: TextStyle(fontSize: 15.0),
                      )
                    ],
                  ),
                ),

                // // ElevatedButton(
                // //   onPressed: () {
                // //     Navigator.push(
                // //         context,
                // //         MaterialPageRoute(
                // //           builder: (context) => Profile(),
                // //         ));
                // //   },
                // //   child: Text('My Profile'),
                // // ),
                // SizedBox(
                //   height: 20,
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => const MyMember(),
                //     ));
                //   },
                //   child: Text('My Member'),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => const PaymentOptions(),
                //     ));
                //   },
                //   child: Text('Payments'),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
