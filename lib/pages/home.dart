import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kavach13/codes.dart';
import 'package:kavach13/pages/addevent.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddEvent()));
              },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border:
                        Border.all(color: AppUIColor.appLightColor, width: 2)),
                child: Center(
                    child: Text(
                  'Add Event',
                  style: GoogleFonts.poppins(
                      fontSize: 26, color: AppUIColor.lightTextColor),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
