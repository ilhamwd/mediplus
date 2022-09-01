import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediplus/components/home.dart';
import 'package:mediplus/components/inherited_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InheritedApi(
      child: MaterialApp(
        title: 'Mediplus',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.rubikTextTheme().copyWith(
                bodyMedium: const TextStyle(color: Color(0xFF5A5A5A)))),
        home: const Home(),
      ),
    );
  }
}
