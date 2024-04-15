import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rest_picker/View/Pages/Home.dart';
import 'package:rest_picker/View/Pages/Selected.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          "Selected": (context) => NameSelector(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.francoisOne().fontFamily,
          useMaterial3: true,
          primaryColor: Colors.white30,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Restaurant Picker',
            style: GoogleFonts.lobster(textStyle: TextStyle(fontSize: 30)),
          ),
        ),
      ),
      body: HomePage(),
    );
  }
}
