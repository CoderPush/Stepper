import 'package:flutter/material.dart';
import 'package:stepper/presentation/area/area.dart';
import 'package:stepper/presentation/home/home.dart';
import 'package:stepper/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        Routes.home: (context) => const HomeScreen(),
        Routes.area: (context) => const AreaScreen()
      },
    );
  }
}
