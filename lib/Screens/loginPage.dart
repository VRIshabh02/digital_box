import 'dart:convert';

import 'package:digital_box/Screens/barclaysHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as D;
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  bool _secureText = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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


                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text("Welcome to Barclays", style: GoogleFonts.poppins(
                  //       fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600
                  //   ), ),
                  // ),

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text("Best and popular app for live education\n course from home",
                  //     style: GoogleFonts.poppins(
                  //         fontSize: 15, color: const Color(0xFFCBCBCB)
                  //     ), textAlign: TextAlign.center, ),
                  // ),




                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                        width: MediaQuery.of(context).size.width- 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "Enter Email",
                                enabled: true,
                                border: InputBorder.none
                            ),
                          ),
                        )
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width- 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.emailAddress,
                            decoration:  InputDecoration(

                                suffixIcon: IconButton(onPressed: (){
                                  setState(() {
                                    _secureText = !_secureText;
                                  });

                                }, icon:  Icon( _secureText ? Icons.visibility_off : Icons.remove_red_eye,
                                    color: Colors.grey)
                                ),
                                hintText: "Enter Password",
                                enabled: true,
                                border: InputBorder.none

                            ),obscureText: _secureText,
                            cursorColor: Colors.red,
                          ),
                        )
                    ),
                  ),




                  SizedBox(height: 30,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                          // Get.offAll(BarclaysHomePage());

                        loginFunction(context, emailController.text, passwordController.text);

                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width -100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text("Login",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: const Color(0xFF2954F5),
                              fontWeight: FontWeight.w500
                          ), textAlign: TextAlign.center, )),
                      ),
                    ),
                  ),

                  SizedBox(height: 30,),
                  SizedBox(height: 30,),


                ],

              ),
            ),
          ]
      ),


    );
  }
}




void loginFunction(BuildContext context, String email, String password) async {

  final dio = D.Dio();
  final response =  await dio.post(
    'http://ec2-13-233-98-115.ap-south-1.compute.amazonaws.com:5000/login',
    data: {
      'email': email,
      'password' : password
    },
    // options: D.Options(contentType: D.Headers.formUrlEncodedContentType),

    options: D.Options(
      contentType: D.Headers.jsonContentType, // Set content type to JSON
    ),
  );

  print(response);
  print(response.data['code']);
  if(response.data['code'] == '200') {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', jsonEncode(response.data));
    print(response.data);
    print(response.data['userId']);

    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    prefs1.setString('userID', jsonEncode(response.data['userId'].toString()));

    Get.offAll(BarclaysHomePage(), arguments: email);
  }
  else{
    _showAlertDialog(context, response.data['message'].toString());
  }
}

void _showAlertDialog(context, String message) {
  showCupertinoModalPopup<void>(
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('Login Failed'),
      content:  Text('$message'),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          /// This parameter indicates this action is the default,
          /// and turns the action's text to bold text.
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Ok'),
        ),
      ],
    ), context: context,
  );
}