import 'package:currency_converter/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {

   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Flutter Demo', theme: ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      brightness:  Brightness.light
    ), home: const HomePage());
  }
}
