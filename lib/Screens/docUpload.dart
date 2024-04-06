import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DocUpload extends StatelessWidget {
  const DocUpload({Key? key}) : super(key: key);

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
                  child: Text("Submit a Proposal",
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
                  child: Text("Cover Letter",
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