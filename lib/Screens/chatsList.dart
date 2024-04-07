import 'dart:convert';
import 'package:digital_box/Models/GetAllChats.dart';
import 'package:digital_box/Models/GetAllChats.dart';
import 'package:digital_box/Models/GetAllChats.dart';
import 'package:http/http.dart' as http;
import 'package:digital_box/Models/GetAllChats.dart';
import 'package:digital_box/Screens/chatsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as D;
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/GetAllChats.dart';
import '../Models/GetAllChats.dart';
import '../Models/GetAllChats.dart';
import '../Models/GetAllChats.dart';
import '../Models/chatUsersModel.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {

  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel",   messageText: "Awesome Setup",                   imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "Glady's Murphy",messageText: "That's Great",                    imageURL: "images/userImage2.jpeg", time: "Yesterday"),
    ChatUsers(name: "Jorge Henry",   messageText: "Hey where are you?",              imageURL: "images/userImage3.jpeg", time: "31 Mar"),
    ChatUsers(name: "Philip Fox",    messageText: "Busy! Call me in 20 mins",        imageURL: "images/userImage4.jpeg", time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome",          imageURL: "images/userImage5.jpeg", time: "23 Mar"),
    ChatUsers(name: "Jacob Pena",    messageText: "will update you in evening",      imageURL: "images/userImage6.jpeg", time: "17 Mar"),
    ChatUsers(name: "Andrey Jones",  messageText: "Can you please share the file?",  imageURL: "images/userImage7.jpeg", time: "24 Feb"),
    ChatUsers(name: "John Wick",     messageText: "How are you?",                    imageURL: "images/userImage8.jpeg", time: "18 Feb"),
    ChatUsers(name: "Philip Fox",    messageText: "Busy! Call me in 20 mins",        imageURL: "images/userImage4.jpeg", time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome",          imageURL: "images/userImage5.jpeg", time: "23 Mar"),
    ChatUsers(name: "Jacob Pena",    messageText: "will update you in evening",      imageURL: "images/userImage6.jpeg", time: "17 Mar"),
    ChatUsers(name: "Andrey Jones",  messageText: "Can you please share the file?",  imageURL: "images/userImage7.jpeg", time: "24 Feb"),
    ChatUsers(name: "John Wick",     messageText: "How are you?",                    imageURL: "images/userImage8.jpeg", time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAllChats(),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            GetAllChats chatsData =
            snapshot.data as GetAllChats;

              return Container(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 10),
                          child: Text("Conversations", style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),),
                        ),

                        // ListView.builder(
                        //   itemCount: chatUsers.length,
                        //   shrinkWrap: true,
                        //   padding: EdgeInsets.only(top: 16),
                        //   physics: NeverScrollableScrollPhysics(),
                        //   itemBuilder: (context, index){
                        //     return ConversationList(
                        //       name: chatsData.ticketData![0].conversations![0].message.toString(),
                        //       messageText: chatUsers[index].messageText,
                        //       imageUrl: chatUsers[index].imageURL,
                        //       time: chatUsers[index].time,
                        //       isMessageRead: (index == 0 || index == 3)?true:false,
                        //     );
                        //   },
                        // ),


                        for(int i = 0; i < chatsData.ticketData!.length; i++)

                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) {
                              //       return ChatsPage();
                              //     }));

                              Get.to(ChatsPage(), arguments: [i]);
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, top: 10, bottom: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        CircleAvatar(
                                          // backgroundImage: NetworkImage(widget.imageUrl),
                                          maxRadius: 30,
                                        ),
                                        SizedBox(width: 16,),
                                        Expanded(
                                          child: Container(
                                            color: Colors.transparent,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[
                                                Text(chatsData.ticketData![i].subject.toString(), style: TextStyle(
                                                    fontSize: 16),),
                                                SizedBox(height: 6,),
                                                Text(chatsData.ticketData![i].status.toString(),style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: FontWeight.normal),),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Text("widget.time",style: TextStyle(fontSize: 12,fontWeight:
                                  // widget.isMessageRead?FontWeight.bold:FontWeight.normal),),
                                ],
                              ),
                            ),
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




class ConversationList extends StatefulWidget{
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  ConversationList({required this.name,required this.messageText,required this.imageUrl,required this.time,required this.isMessageRead});
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ChatsPage();
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.imageUrl),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.name, style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),
                          Text(widget.messageText,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(widget.time,style: TextStyle(fontSize: 12,fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}


Future<GetAllChats> getAllChats() async {
  SharedPreferences prefs1 = await SharedPreferences.getInstance();
  String? data1 = prefs1.getString('userID');
  print(data1);

  var requestURL = Uri.parse('http://ec2-13-233-98-115.ap-south-1.compute.amazonaws.com:3000/ticket/getAllTickets/${data1.toString().substring(1,25)}');


print(requestURL);
  final response = await http.get(requestURL);
  var data = jsonDecode(response.body.toString());
  print(data);
  if (data['code'] == 200) {
    return GetAllChats.fromJson(data);
  } else {
    return GetAllChats.fromJson(data);
  }
}


void _showAlertDialog(context, String message) {
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