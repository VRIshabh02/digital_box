import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFF2954F5),
      appBar: AppBar(elevation: 0,backgroundColor: Color(0xFF2954F5),

        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back, color: Colors.white,)),
        title: Text("Settings",
          style: GoogleFonts.roboto(
              fontSize: 20, color: Colors.white,
              fontWeight: FontWeight.w400
          ),
          textAlign: TextAlign.center,
        ),

      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              color: Colors.white
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/20,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue

                    ),

                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name",
                        style: GoogleFonts.roboto(
                            fontSize: 20, color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text("Designation",
                        style: GoogleFonts.roboto(
                            fontSize: 15, color: Color(0xff676767),
                            fontWeight: FontWeight.w400
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/25,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width/12,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue

                      ),

                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Account",
                          style: GoogleFonts.roboto(
                              fontSize: 17, color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text("Privacy, security and change number",
                          style: GoogleFonts.roboto(
                              fontSize: 12, color: Color(0xff676767),
                              fontWeight: FontWeight.w400
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width/12,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue

                      ),

                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Chat",
                          style: GoogleFonts.roboto(
                              fontSize: 17, color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text("Chat history, Documents",
                          style: GoogleFonts.roboto(
                              fontSize: 12, color: Color(0xff676767),
                              fontWeight: FontWeight.w400
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width/12,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue

                      ),

                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Notifications",
                          style: GoogleFonts.roboto(
                              fontSize: 17, color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text("Messages, groups and others",
                          style: GoogleFonts.roboto(
                              fontSize: 12, color: Color(0xff676767),
                              fontWeight: FontWeight.w400
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width/12,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue

                      ),

                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Help",
                          style: GoogleFonts.roboto(
                              fontSize: 17, color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text("Help canter, contact us, privacy policy",
                          style: GoogleFonts.roboto(
                              fontSize: 12, color: Color(0xff676767),
                              fontWeight: FontWeight.w400
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width/12,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue

                      ),

                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Documents",
                          style: GoogleFonts.roboto(
                              fontSize: 17, color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text("Check the shared files",
                          style: GoogleFonts.roboto(
                              fontSize: 12, color: Color(0xff676767),
                              fontWeight: FontWeight.w400
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),


          ],

        ),
      ),


    );
  }
}
