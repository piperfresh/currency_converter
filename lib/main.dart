import 'package:currency_converter/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return ProviderScope(
      child: MaterialApp(
          title: 'Flutter Demo', theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.cyan,
          centerTitle: true,
        ),
        brightness:  Brightness.light
      ), home: const HomePage()),
    );
  }
}
