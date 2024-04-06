import 'package:digital_box/Screens/barclaysHomePage.dart';
import 'package:digital_box/Screens/carousel2.dart';
import 'package:digital_box/Screens/carousel3.dart';
import 'package:digital_box/Screens/bottomBar.dart';
import 'package:digital_box/Screens/docUpload.dart';
import 'package:digital_box/Screens/home.dart';
import 'package:digital_box/Screens/homeScreen.dart';
import 'package:digital_box/Screens/loginPage.dart';
import 'package:digital_box/Screens/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/carousel1.dart';
import 'Screens/getStartedScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      MyHomePage(),
      // ProfilePage()

    );
  }
}


