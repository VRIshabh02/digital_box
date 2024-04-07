import 'package:digital_box/Screens/chatsList.dart';
import 'package:digital_box/Screens/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
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
            child: Text("DigiBox",
              style: GoogleFonts.roboto(
                  fontSize: 25, color: Color(0xFF2954F5),
                  fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
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


      body: ChatList(),
    );
  }
}


