import 'package:flutter/material.dart';
import 'package:project_firebase/screens/home_page.dart';
import 'package:project_firebase/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'package:project_firebase/controller/themeprovider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      child: MyApp(),
      create: (BuildContext context) => ThemeProvider(isDarkMode: true),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kistu Shopping',
          routes: {
            '/login': (context) => LoginPage(),
            '/home': (context) => HomePage(),
          },
          home: LoginPage(),
        );
      },
    );
  }
}
