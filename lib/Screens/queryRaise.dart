import 'dart:convert';
import 'dart:io';
import 'package:digital_box/Screens/bottomBar.dart';
import 'package:digital_box/Screens/home.dart';
import 'package:dio/dio.dart' as D;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'barclaysHomePage.dart';

class QueryRaise extends StatefulWidget {
  const QueryRaise({Key? key}) : super(key: key);

  @override
  State<QueryRaise> createState() => _QueryRaiseState();
}

class _QueryRaiseState extends State<QueryRaise> {


  bool isLoadingButtonFile = false;
  bool isLoadingButtonQuery = false;
  var textController = TextEditingController();

  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;


  void pickFile() async{
    try{
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if(result != null){
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());


        print("File name $_fileName");
      }


      setState(() {
        isLoading= false;
      });
    }catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeaeaea),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Submit a Query",
                    style: GoogleFonts.roboto(
                        fontSize: 20, color: Colors.black,
                        fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Additional details",
                    style: GoogleFonts.roboto(
                        fontSize: 15, color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text("Subject",
                    style: GoogleFonts.roboto(
                        fontSize: 14, color: Colors.black54,
                        fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 4, bottom: 8),
                  child: Container(
                    height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white60
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 160,
                                width: 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 200,
                                child: TextFormField(
                                  controller: textController,

                                  decoration: InputDecoration(
                                    hintText: "Text Here",
                                    enabled: true,
                                    border: InputBorder.none
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Attachments",
                    style: GoogleFonts.roboto(
                        fontSize: 20, color: Colors.black,
                        fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 4, bottom: 8),
                  child: GestureDetector(
                    onTap: (){
                      pickFile();
                    },
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white60
                      ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.cloud_upload_sharp, size: 75,color: Colors.black54,),

                                Text("Attach Files",
                                  style: GoogleFonts.roboto(
                                      fontSize: 14, color: Colors.black54,
                                      fontWeight: FontWeight.w400
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                    ),
                  ),
                ),

                // pickedfile != null ?
                //     Image.file(fileToDisplay!) :
                // Container(),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text("You may attach up to 10 files under the size \n"
                        "of 25 MB each. Include documents to\n"
                        "support your Complaint.",
                      style: GoogleFonts.roboto(
                          fontSize: 14, color: Colors.black54,
                          fontWeight: FontWeight.w400
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () async{
                    if(fileToDisplay != null) {
                      setState(() {
                        isLoadingButtonFile = true;
                      });


                      SharedPreferences prefs1 = await SharedPreferences.getInstance();
                      String? data1 = prefs1.getString('userID');

                      print(data1);
                      docUploadFunc(context,
                          data1!
                          , _fileName.toString(), fileToDisplay);
                    }
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width -100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child:

                        isLoadingButtonFile == false ?

                        Text("Upload Document",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: const Color(0xFF2954F5),
                              fontWeight: FontWeight.w500
                          ), textAlign: TextAlign.center, ) :
                        CircularProgressIndicator()

                        ),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () async{
                    if(fileToDisplay != null) {
                      setState(() {
                        isLoadingButtonQuery = true;
                      });


                      SharedPreferences prefs1 = await SharedPreferences.getInstance();
                      String? data1 = prefs1.getString('userID');

                      print(data1);

                      queryCreateFunction(context,
                          data1!,
                          "Subject",
                          textController.text);

                    }
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width -100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child:


                        isLoadingButtonQuery == false ?

                        Text("Submit Query",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: const Color(0xFF2954F5),
                              fontWeight: FontWeight.w500
                          ), textAlign: TextAlign.center, ) :
                        CircularProgressIndicator()


                        ),
                      ),
                    ),
                  ),
                ),




                SizedBox(
                  height: MediaQuery.of(context).size.height/6,
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}



void docUploadFunc(BuildContext context, String url1, String url2, File? file) async {
  final dio = D.Dio();
  String getFileExtension(String fileName) {
    return ".${fileName.split('.').last}".toLowerCase();
  }

  print(url2);
  print(url1);
  
  try {
    final response = await dio.put(
      //url1 userid  url2 filename
      'https://juiqv3y7mf.execute-api.ap-south-1.amazonaws.com/v3/digibox-docs/$url1/$url2',
      data: file?.readAsBytesSync(),
      options: D.Options(
        contentType:
        getFileExtension == 'pdf' ?
        'application/pdf' : "application/png"
        //headers: {"appusertoken": "$htoken"}
      ),
    );

    print(response);

    if ( response.data['statusCode'] == 200)

    // If code is not 200 or login is unsuccessful, show error message
    _showAlertDialog(context, response.data['message'].toString());
  } catch (e) {
    print('Error: $e');
    // Handle other types of errors (e.g., network errors)
    _showAlertDialog1(context, 'An error occurred. Please try again later.');
  }
}


void _showAlertDialog(context, String message) {
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
            Navigator.pop(context);

          },
          child:  Text('Ok'),
        ),
      ],
    ), context: context,
  );
}

void _showAlertDialog1(context, String message) {
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



void queryCreateFunction(BuildContext context, String clientId, String subject, String message) async {

  print(message);
  final dio = D.Dio();
  final response =  await dio.post(
    'http://ec2-13-233-98-115.ap-south-1.compute.amazonaws.com:3000/ticket',
    data:
  //   {
  // "clientId": clientId,
  // "subject": subject,
  // "conversation": {
  // "sender": "Customer",
  // "message": message
  // }
  //   },

    {
      "clientId": clientId.toString().substring(1,25),
      "colleagueId": "66114c074a88dfb496f4804f",
      "subject": "Phone not working",
      "conversation": {
        "sender": "Customer",
        "message": message
      }
    },

    options: D.Options(
      contentType: D.Headers.jsonContentType, // Set content type to JSON
    ),
  );

  print(response);
  print(response.data['code']);
  if(response.data['code'] == '200') {


    //userDataGlobal = await getProfileApi();


    // Get.offAll(BarclaysHomePage(), arguments: email);
    _showAlertDialog3(context, response.data['message'].toString());
  }
  else{
    _showAlertDialog4(context, response.data['message'].toString());
  }
}

void _showAlertDialog3(context, String message) {
  showCupertinoModalPopup<void>(
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('Success'),
      content:  Text('Query created'),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          /// This parameter indicates this action is the default,
          /// and turns the action's text to bold text.
          isDefaultAction: true,
          onPressed: () {

            Get.offAll(BottomBar());
          },
          child: const Text('Ok'),
        ),
      ],
    ), context: context,
  );
}

void _showAlertDialog4(context, String message) {
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