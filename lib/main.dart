import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:run_api/Home.dart';
import 'package:run_api/theme/themeProvider.dart';
//import 'package:run_api/homepage.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const Home(), //Homepage()
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
