import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kavach13/pages/signuppage.dart';

import '../codes.dart';
import 'home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome Back',
              style: GoogleFonts.poppins(
                  fontSize: 19,
                  color: AppUIColor.appLightColor,
                  fontWeight: FontWeight.w600),
            ),
            Text('Login to continue',
                style: GoogleFonts.poppins(
                    fontSize: 19,
                    color: AppUIColor.appLightColor,
                    fontWeight: FontWeight.normal)),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text('Email Address',
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: AppUIColor.appLightColor,
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              height: 17,
            ),
            Center(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppUIColor.appLightColor),
                  borderRadius: BorderRadius.circular(12)),
              height: 56,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: email,
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          hintText: 'abcdefghi@email.com',
                          hintStyle: GoogleFonts.lato(color: Colors.grey),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.mail_outline_outlined,
                            size: 31,
                            color: AppUIColor.appLightColor,
                          )),
                    )),
              ),
            )),
            SizedBox(
              height: 22,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text('Password',
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: AppUIColor.appLightColor,
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              height: 17,
            ),
            Center(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppUIColor.appLightColor),
                  borderRadius: BorderRadius.circular(12)),
              height: 56,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: password,
                      obscureText: true,
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          hintText: '***********',
                          hintStyle: GoogleFonts.lato(color: Colors.grey),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            size: 31,
                            color: AppUIColor.appLightColor,
                          )),
                    )),
              ),
            )),
            SizedBox(
              height: 22,
            ),
            GestureDetector(
              onTap: () {
                login(email.text, password.text, context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 56,
                decoration: BoxDecoration(
                    color: AppUIColor.appLightColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    'LOG IN',
                    style: GoogleFonts.poppins(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 31,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (Context) => SignUpPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: AppUIColor.lightTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Sign up now',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: AppUIColor.appLightColor,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void login(String emailAddress, String password, context) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No user found for that email')));
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Wrong password provided for that user.')));
      print('Wrong password provided for that user.');
    }
  }
}
