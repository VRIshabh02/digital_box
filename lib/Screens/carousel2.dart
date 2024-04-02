import 'package:digital_box/Screens/carousel3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Carousel2 extends StatelessWidget {
  const Carousel2({super.key});

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
                  children: [

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
                                    child: Text("Organise Your \nCommunication Channels",
                                      style: GoogleFonts.poppins(
                                          fontSize: 25, color: Colors.black,
                                          fontWeight: FontWeight.w500
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Centrealize messages, emails and \n "
                                        "notifications effortlessly. Prioritize\n"
                                        "conversations, categorize emails efficiently,\n"
                                        "stay updated effortlessly",
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
                                          Get.off(const Carousel3());
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            color: const Color(0xFF2954F5),
                                          ),
                                          child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Image.asset("assets/rightArrow.png",
                                                color: Colors.white,
                                                height: 15,
                                                width: 15,
                                              )
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

                              child: Image.asset("assets/organise.png.png"))),
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
