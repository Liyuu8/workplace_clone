import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

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
      localizationsDelegates: [
        // 多言語対応
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales, // 多言語対応
      home: HomeScreen(),
    );
  }
}
