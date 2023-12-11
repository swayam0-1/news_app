

import 'dart:async';
import 'package:flutter/material.dart';

import 'package:news_app/view/home/home_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });

  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1 ;
    final width = MediaQuery.sizeOf(context).width * 1 ;

    return  Scaffold(
      body: Container(
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/splsh.png',
              fit: BoxFit.cover,
              height:  height * .2,
            ),
            SizedBox(height: height * 0.04,),
            Text('TOP HEADLINES' , style: GoogleFonts.anton(letterSpacing: .6 , color: Colors.black),),
            SizedBox(height: height * 0.04,),
            SpinKitChasingDots(
              color: Colors.white ,
              size: 40,
            )

          ],
        ),
      ),
    );
  }
}