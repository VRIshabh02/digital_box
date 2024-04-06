import 'package:digital_box/Screens/bottomBar.dart';
import 'package:digital_box/Screens/home.dart';
import 'package:digital_box/Screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Carousel3 extends StatelessWidget {
  const Carousel3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFF2954F5),
      body: Stack(
          children:[
            Image.asset("assets/ornament.png"),
            SingleChildScrollView(
              child: Container(
                child: Stack(
                  children:[
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height/2.35,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/10,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width -25,
                              height: MediaQuery.of(context).size.height/2.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height/30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Seamless Document \nManagement",
                                      style: GoogleFonts.poppins(
                                          fontSize: 25, color: Colors.black,
                                          fontWeight: FontWeight.w500
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Manage documents securely. Easily\n "
                                        "upload, download and organize files\n"
                                        "for seamless collaboration and\n"
                                        "peace of mind.",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15, color: Colors.black,
                                        // fontWeight: FontWeight.w300
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                  SizedBox(height: MediaQuery.of(context).size.height/30,),

                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          Get.off(BottomBar());
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width -100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: const Color(0xFF2954F5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Text("Let's Begin!",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15, color: Colors.white,
                                                  fontWeight: FontWeight.w400
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [

                        SizedBox(
                            height: MediaQuery.of(context).size.height/10
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Container(
                              width: MediaQuery.of(context).size.height/2.5,

                              child: Image.asset("assets/seamless.png.png"))),
                        ),




                      ]
                  ),
      ]
                ),
              ),
            ),
          ]
      ),
    );
  }
}
