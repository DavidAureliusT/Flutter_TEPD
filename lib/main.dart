// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/ui/pages/pages.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter_widgets/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: SignInPage(),
    );
  }
}
