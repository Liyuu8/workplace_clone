import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// styles
import 'package:workplace_clone/styles.dart';

// screens
import 'package:workplace_clone/view/welcome/screens/welcome_screen.dart';
import 'package:workplace_clone/view/common/screens/home_screen.dart';

// di
import 'package:workplace_clone/di/providers.dart';

// view models
import 'package:workplace_clone/view_models/welcome_view_model.dart';

void main() async {
  // 非同期処理を行うために必要らしい
  WidgetsFlutterBinding.ensureInitialized();

  // Firebaseの初期化
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: globalProviders,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final welcomeViewModel =
        Provider.of<WelcomeViewModel>(context, listen: false);

    return MaterialApp(
      title: 'WorkplaceClone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.light,
        buttonColor: Colors.white,
        primaryIconTheme: IconThemeData(color: Colors.black26),
        iconTheme: IconThemeData(color: Colors.black26),
        fontFamily: kRegularFont,
      ),
      localizationsDelegates: [
        // 多言語対応
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales, // 多言語対応
      home: FutureBuilder(
        future: welcomeViewModel.isSignIn(),
        builder: (context, AsyncSnapshot<bool> snapshot) =>
            snapshot.hasData && snapshot.data ? HomeScreen() : WelcomeScreen(),
      ),
    );
  }
}
