import 'package:digital_box/Screens/chatsList.dart';
import 'package:digital_box/Screens/docUpload.dart';
import 'package:digital_box/Screens/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/GetAllChats.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeaeaea),
      drawer: Drawer(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/10,),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width-100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("About DigiBox",
                    style: GoogleFonts.roboto(
                        fontSize: 15, color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/80,),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width-100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("Feedback",
                    style: GoogleFonts.roboto(
                        fontSize: 15, color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/80,),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width-100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("Terms and Conditions",
                    style: GoogleFonts.roboto(
                        fontSize: 15, color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/80,),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width-100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("Privacy Policies",
                    style: GoogleFonts.roboto(
                        fontSize: 15, color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/80,),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width-100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("FAQs",
                    style: GoogleFonts.roboto(
                        fontSize: 15, color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height/80,),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width-100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("Settings",
                    style: GoogleFonts.roboto(
                        fontSize: 15, color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(builder: (context) {
          return

            IconButton(
              icon:  Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.menu, color: Colors.grey,),
                  )),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );


          // GestureDetector(
          //     onTap: (){
          //       Scaffold.of(context).openDrawer();
          //     },
          //     child: Image.asset("assets/menuIcon.png")
          // );
        }
        ),
        title: Center(
          child: Container(
            child: Column(
              children: [
                Text("Let's Begin",
                  style: GoogleFonts.roboto(
                      fontSize: 13, color: Color(0xff676767),
                      fontWeight: FontWeight.w400
                  ),
                  textAlign: TextAlign.center,
                ),
                Text("Welcome to DigiBox",
                  style: GoogleFonts.roboto(
                      fontSize: 15, color: Color(0xFF2954F5),
                      fontWeight: FontWeight.w400
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Get.to(ProfilePage());
              },
              child: Container(
                  child: Icon(Icons.person)
              ),
            ),
          )
        ],
      ),





      body: FutureBuilder(
        future: getAllChats(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            GetAllChats chatsData =
            snapshot.data as GetAllChats;

            print(chatsData);



            return Container(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height / 30,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text("Documents",
                              style: GoogleFonts.roboto(
                                  fontSize: 20, color: Colors.black,
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(DocUpload());
                              },
                              child: Container(
                                height: 30,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF2954F5)
                                ),
                                child: Icon(Icons.add, color: Colors.white,),
                              ),
                            ),
                          )
                        ],
                      ),

                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(16.0),
                      //     child: Row(
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Container(
                      //             height: MediaQuery
                      //                 .of(context)
                      //                 .size
                      //                 .height / 3.2,
                      //             width: MediaQuery
                      //                 .of(context)
                      //                 .size
                      //                 .width / 1.5,
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(10),
                      //                 color: Colors.white
                      //             ),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Container(
                      //             height: MediaQuery
                      //                 .of(context)
                      //                 .size
                      //                 .height / 3.2,
                      //             width: MediaQuery
                      //                 .of(context)
                      //                 .size
                      //                 .width / 1.5,
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(10),
                      //                 color: Colors.white
                      //             ),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Container(
                      //             height: MediaQuery
                      //                 .of(context)
                      //                 .size
                      //                 .height / 3.2,
                      //             width: MediaQuery
                      //                 .of(context)
                      //                 .size
                      //                 .width / 1.5,
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(10),
                      //                 color: Colors.white
                      //             ),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Container(
                      //             height: MediaQuery
                      //                 .of(context)
                      //                 .size
                      //                 .height / 3.2,
                      //             width: MediaQuery
                      //                 .of(context)
                      //                 .size
                      //                 .width / 1.5,
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(10),
                      //                 color: Colors.white
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Queries",
                          style: GoogleFonts.roboto(
                              fontSize: 20, color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),

                      Column(
                        children: [

                          for(int i = 0; i < chatsData.ticketData!.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                        chatsData.ticketData![i].status == "closed" ?
                                        Icons.close : Icons.check


                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(chatsData.ticketData![i].subject.toString(),
                                          style: GoogleFonts.roboto(
                                              fontSize: 20, color: Colors.black,
                                              fontWeight: FontWeight.w500
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                        Text(
                                          chatsData.ticketData![i].openAt.toString().substring(0,10),
                                          style: GoogleFonts.roboto(
                                              fontSize: 15,
                                              color: Color(0xff676767),
                                              fontWeight: FontWeight.w500
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 6,
                      )
                    ],
                  ),
                ),
              ),
            );
          }else{
            return CircularProgressIndicator();
          }
        }
      ),
    );
  }
}
