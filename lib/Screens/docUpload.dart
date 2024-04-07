import 'dart:io';
import 'package:digital_box/Screens/bottomBar.dart';
import 'package:dio/dio.dart' as D;

import 'package:digital_box/Screens/queryRaise.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class DocUpload extends StatefulWidget {
  const DocUpload({super.key});

  @override
  State<DocUpload> createState() => _DocUploadState();
}

class _DocUploadState extends State<DocUpload> {

  bool isLoadingButton = false;

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
      body: Column(
        children: [

          SizedBox(height: MediaQuery.of(context).size.height/20,),

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
                  color: Colors.white
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
                isLoadingButton = true;
              });


              SharedPreferences prefs1 = await SharedPreferences.getInstance();
              String? data1 = prefs1.getString('userID');

              print(data1);
              docUploadFunc1(context,
                  data1!
                  , _fileName.toString(), fileToDisplay);
            }
          },
          child: Center(
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width -100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child:
              isLoadingButton == false ?

              Text("Upload",
                style: GoogleFonts.poppins(
                    fontSize: 15, color: const Color(0xFF2954F5),
                    fontWeight: FontWeight.w500
                ), textAlign: TextAlign.center, ) :
                  CircularProgressIndicator()
              )
            ),
          ),
        ),

        ],
      ),

    );
  }
}


void docUploadFunc1(BuildContext context, String url1, String url2, File? file) async {
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

