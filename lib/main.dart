import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:somobai/added_by_sifat/update_view_profile.dart';
import 'package:somobai/screens/addMember.dart';
import 'package:somobai/screens/addPayment.dart';
import 'package:somobai/screens/createjoin.dart';
import 'package:somobai/screens/createsomobai.dart';
import 'package:somobai/screens/home_admin.dart';
import 'package:somobai/screens/joinsomobai.dart';
import 'package:somobai/screens/mymember.dart';
import 'package:somobai/screens/myprofile.dart';
import 'package:somobai/screens/paymentDetail.dart';
import 'package:somobai/screens/payment_option.dart';
import 'package:somobai/screens/viewMember.dart';
import 'package:somobai/screens/viewPayment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Somobai',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff1595ba),
        ),
      ),
      home: CreateJoin(),
    );
  }
}
