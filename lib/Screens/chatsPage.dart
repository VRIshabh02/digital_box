import 'package:digital_box/Models/GetAllChats.dart';
import 'package:digital_box/Screens/bottomBar.dart';
import 'package:digital_box/Screens/chatsList.dart';
import 'package:digital_box/Screens/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as D;
import 'package:google_fonts/google_fonts.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {

  late GetAllChats chatsData;
  var chatController = TextEditingController();

  dynamic argumentData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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


      body: Stack(

        children:
        [

          FutureBuilder(
            future: getAllChats(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                 chatsData =
                snapshot.data as GetAllChats;
                return ListView.builder(
                  itemCount: chatsData.ticketData![argumentData[0]].conversations!.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment: (chatsData.ticketData![argumentData[0]].conversations![index].sender == "representative"
                            ? Alignment.topRight
                            : Alignment.topLeft),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (chatsData.ticketData![argumentData[0]].conversations![index].sender == "representative"
                                ? Colors.grey.shade200
                                : Colors.blue[200]),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(chatsData.ticketData![argumentData[0]].conversations![index].message.toString(),
                            style: TextStyle(fontSize: 15),),
                        ),
                      ),
                    );
                  },
                );
              }else{
                return CircularProgressIndicator();
              }
            }
          ),



        Column(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
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
                          controller: chatController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Enter your message here...",
                              enabled: true,
                              border: InputBorder.none
                          ),
                        ),
                      )
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){

                       updateTicket(setState, context, chatsData.ticketData![argumentData[0]].sId.toString(), "Customer",chatController.text );

                      chatController.clear();
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF2954F5)
                      ),
                      child: Icon(Icons.arrow_upward, color: Colors.white,),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: MediaQuery.of(context).size.height/40,)
          ],
        ),
      ]
      ),

    );
  }
}


class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}


// List<ChatMessage> messages = [
//   ChatMessage(messageContent: "Hello", messageType: "receiver"),
//   ChatMessage(messageContent: "How are you?", messageType: "receiver"),
//   ChatMessage(messageContent: "cnbebceri", messageType: "sender"),
//   ChatMessage(messageContent: "evreverververvev", messageType: "receiver"),
//   ChatMessage(messageContent: "vervrverv", messageType: "sender"),
// ];



void updateTicket(void Function(void Function()) setState, BuildContext context, String ticketID, String sender, String message) async {
  final dio = D.Dio();

  print(ticketID);
  print(message);
  try {
    final response = await dio.put(
      'http://ec2-13-233-98-115.ap-south-1.compute.amazonaws.com:3000/ticket/updateTicket',
      data: {
        "ticketId": ticketID,
        "sender": "representative",
        "message": message
      },
      // options: D.Options(contentType: D.Headers.formUrlEncodedContentType),

      options: D.Options(
        contentType: D.Headers.jsonContentType, // Set content type to JSON
      ),
    );

    setState(() {

    });
    print(response);

    if ( response.data['code'] == 200)

      // If code is not 200 or login is unsuccessful, show error message
      _showAlertDialog1(context, response.data['message'].toString());
  } catch (e) {
    print('Error: $e');
    // Handle other types of errors (e.g., network errors)
    _showAlertDialog11(context, 'An error occurred. Please try again later.');
  }
}


void _showAlertDialog1(context, String message) {
  showCupertinoModalPopup<void>(
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('Success'),
      content:  const Text('File uploaded successfully'),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          /// This parameter indicates this action is the default,
          /// and turns the action's text to bold text.
          isDefaultAction: true,
          onPressed: () {
            // Navigator.pop(context);
            Get.off(BottomBar());
          },
          child:  Text('Ok'),
        ),
      ],
    ), context: context,
  );
}

void _showAlertDialog11(context, String message) {
  showCupertinoModalPopup<void>(
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('Failed'),
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