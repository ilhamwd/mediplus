import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediplus/components/screens/home_page.dart';
import 'package:mediplus/system/api.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Builder(builder: (context) {
        Api.of(context).sharedContext = context;

        return const SafeArea(
          child: HomePage(),
        );
      }),
    );
  }
}
