import 'package:flutter/material.dart';

// styles
import 'package:workplace_clone/styles.dart';

// screens
import 'package:workplace_clone/view/common/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkplaceClone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.light,
        buttonColor: Colors.white,
        primaryIconTheme: IconThemeData(color: Colors.black26),
        iconTheme: IconThemeData(color: Colors.black26),
        fontFamily: RegularFont,
      ),
      home: HomeScreen(),
    );
  }
}
