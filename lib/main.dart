import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(
        title: 'Login Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final custom_dir = "logs.txt";
  Future<File> appendToFile(String content) async {
    // Open the file in append mode
    final file = File(custom_dir);
    return await file.writeAsString(content, mode: FileMode.append);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            const SizedBox(
              width: 15,
            ),
            CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: const Icon(Icons.exit_to_app_rounded),
                  onTap: () async {},
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: const Icon(Icons.help_center_rounded),
                  onTap: () {},
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: const SingleChildScrollView(
          child: Loginpage(),
        ));
  }
}
