import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/travelScreen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travel",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: GoogleFonts.lato().fontFamily,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Travel(),
    );
  }
}

class Travel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TravelScreen(),
    );
  }
}

void main() => runApp(MyApp());
