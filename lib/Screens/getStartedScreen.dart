import 'package:digital_box/Screens/barclaysHomePage.dart';
import 'package:digital_box/Screens/carousel1.dart';
import 'package:digital_box/Screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF2954F5),
      body: Stack(
          children:[
            Image.asset("assets/ornament.png"),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [



                  SizedBox(
                      height: MediaQuery.of(context).size.height/10
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Center(child: Container(
                  //       width: 300,
                  //
                  //       child: Image.asset("assets/Logo.png"))),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Barclays",
                      style: GoogleFonts.poppins(
                          fontSize: 35, color: const Color(0xFFCBCBCB)
                      ), textAlign: TextAlign.center, ),
                  ),




                  SizedBox(
                      height: MediaQuery.of(context).size.height/15
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Welcome to Barclays", style: GoogleFonts.poppins(
                        fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600
                    ), ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("",
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: const Color(0xFFCBCBCB)
                      ), textAlign: TextAlign.center, ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        // Get.offAll(const BarclaysHomePage());

                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        String? userData = prefs.getString('userData');
                        if (userData != null) {
                          Get.offAll(const BarclaysHomePage());}
                        else{
                          Get.offAll(const LogInPage());
                        }



                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width -100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text("Get Started",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: const Color(0xFF2954F5),
                              fontWeight: FontWeight.w500
                          ), textAlign: TextAlign.center, )),
                      ),
                    ),
                  )

                ],

              ),
            ),
          ]
      ),


    );



  }
}