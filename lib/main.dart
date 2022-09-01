import 'package:flutter/material.dart';
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
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
