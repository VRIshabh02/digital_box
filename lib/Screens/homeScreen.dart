import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcccaca),
      drawer: Drawer(

      ),
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Color(0xffcccaca),
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
            child: Container(
              child: Icon(Icons.person)
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: MediaQuery.of(context).size.height/30,),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Document Status",
                  style: GoogleFonts.roboto(
                      fontSize: 20, color: Colors.black,
                      fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.right,
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height/3.2,
                          width: MediaQuery.of(context).size.width/1.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height/3.2,
                          width: MediaQuery.of(context).size.width/1.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height/3.2,
                          width: MediaQuery.of(context).size.width/1.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height/3.2,
                          width: MediaQuery.of(context).size.width/1.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Customer Feedback",
                  style: GoogleFonts.roboto(
                      fontSize: 20, color: Colors.black,
                      fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.right,
                ),
              ),

              Column(
                children: [
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
                            child: Icon(Icons.person),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Customer",
                                  style: GoogleFonts.roboto(
                                      fontSize: 20, color: Colors.black,
                                      fontWeight: FontWeight.w500
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                Text("Customer Feedback jvj ej f j kf f dfjk df fd ",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: Color(0xff676767),
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
                            child: Icon(Icons.person),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Customer",
                                  style: GoogleFonts.roboto(
                                      fontSize: 20, color: Colors.black,
                                      fontWeight: FontWeight.w500
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                Text("Customer Feedback jvj ej f j kf f dfjk df fd ",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: Color(0xff676767),
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
                            child: Icon(Icons.person),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Customer",
                                  style: GoogleFonts.roboto(
                                      fontSize: 20, color: Colors.black,
                                      fontWeight: FontWeight.w500
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                Text("Customer Feedback jvj ej f j kf f dfjk df fd ",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: Color(0xff676767),
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
                            child: Icon(Icons.person),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Customer",
                                  style: GoogleFonts.roboto(
                                      fontSize: 20, color: Colors.black,
                                      fontWeight: FontWeight.w500
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                Text("Customer Feedback jvj ej f j kf f dfjk df fd ",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: Color(0xff676767),
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
                  )
                ],
              )



            ],
          ),
        ),
      ),
    );
  }
}
