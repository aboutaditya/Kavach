import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kavach13/codes.dart';
import 'package:kavach13/pages/home.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController guardNo = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController duration = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppUIColor.appLightColor,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text('Event Name',
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: AppUIColor.appLightColor,
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              height: 13,
            ),
            Center(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppUIColor.appLightColor),
                  borderRadius: BorderRadius.circular(12)),
              height: 53,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextField(
                      controller: name,
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: 'Enter your event name',
                        hintStyle: GoogleFonts.lato(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    )),
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text('Event Date',
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: AppUIColor.appLightColor,
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              height: 13,
            ),
            Center(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppUIColor.appLightColor),
                  borderRadius: BorderRadius.circular(12)),
              height: 53,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextField(
                      controller: date,
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: 'Enter the date',
                        hintStyle: GoogleFonts.lato(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    )),
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text('No. of Guards',
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: AppUIColor.appLightColor,
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              height: 13,
            ),
            Center(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppUIColor.appLightColor),
                  borderRadius: BorderRadius.circular(12)),
              height: 53,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextField(
                      controller: guardNo,
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: 'Enter the no.',
                        hintStyle: GoogleFonts.lato(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    )),
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text('Event Location',
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: AppUIColor.appLightColor,
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              height: 13,
            ),
            Center(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppUIColor.appLightColor),
                  borderRadius: BorderRadius.circular(12)),
              height: 53,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextField(
                      controller: location,
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: 'Enter your event location',
                        hintStyle: GoogleFonts.lato(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    )),
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text('Event location Area',
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: AppUIColor.appLightColor,
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              height: 13,
            ),
            Center(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppUIColor.appLightColor),
                  borderRadius: BorderRadius.circular(12)),
              height: 53,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextField(
                      controller: area,
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: 'Enter your event area',
                        hintStyle: GoogleFonts.lato(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    )),
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text('Event Duration',
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: AppUIColor.appLightColor,
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              height: 13,
            ),
            Center(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppUIColor.appLightColor),
                  borderRadius: BorderRadius.circular(12)),
              height: 53,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextField(
                      controller: duration,
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: 'Enter your event duration',
                        hintStyle: GoogleFonts.lato(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    )),
              ),
            )),
            SizedBox(
              height: 31,
            ),
            GestureDetector(
              onTap: (){
                  AddEventData(name: name.text, date: date.text, guardNo: guardNo.text, location: location.text, area: area.text, duration: duration.text,context: context);
              },
              child: Container(
                height: 71,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border:
                        Border.all(color: AppUIColor.appLightColor, width: 1)),
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Center(
                      child: Text(
                        "Add Event",
                        style: GoogleFonts.poppins(
                            fontSize: 26, color: AppUIColor.appLightColor),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}

Future AddEventData(
    {required String name,
    required String date,
    required String guardNo,
    required String location,
    required area,
    required duration, required BuildContext context}) async {
  final docUser = FirebaseFirestore.instance.collection('Events').doc();
  String mail = FirebaseAuth.instance.currentUser!.email!;
  final json = {
    'id': docUser.id,
    'Event Name': name,
    'date': date,
    'mail': mail,
    'No. of Guards': guardNo,
    'Location': location,
    'Area': area,
    'Duration': duration,
  };
  await docUser.set(json);
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('New Event added')));
  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
}
