import 'package:flutter/material.dart';
import 'package:rive_animacoes/pages/rive_page.dart';

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
      title: 'Flutter Demo Rive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RivePage(),
    );
  }
}
