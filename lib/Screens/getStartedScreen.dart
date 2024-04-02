import 'package:digital_box/Screens/carousel1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [



                SizedBox(
                    height: MediaQuery.of(context).size.height/10
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Container(
                      width: 300,

                      child: Image.asset("assets/Logo.png"))),
                ),

                SizedBox(
                    height: MediaQuery.of(context).size.height/15
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Welcome to DigiBox", style: GoogleFonts.poppins(
                      fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600
                  ), ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Best and popular app for live education\n course from home",
                    style: GoogleFonts.poppins(
                        fontSize: 15, color: const Color(0xFFCBCBCB)
                    ), textAlign: TextAlign.center, ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Get.offAll(const Carousel1());
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
          ]
      ),


    );



  }
}