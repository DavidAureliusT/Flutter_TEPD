import 'package:flutter/material.dart';
import 'package:flutter_widgets/ui/pages/pages.dart';

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
