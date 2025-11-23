import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo - Atadewa',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String documentPath = '';
  String tempPath = '';
  int appCounter = 0;
  late File myFile;
  String fileText = '';

  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Aditya Atadewa - 2341720174');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;
    await prefs.setInt('appCounter', appCounter);
    setState(() {
      appCounter = appCounter;
    });
  }

  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  @override
  void initState() {
    super.initState();
    readAndWritePreference();
    getPaths().then((_) {
      myFile = File('$documentPath/pizzas.txt');
      writeFile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Path Provider - Atadewa'),
        backgroundColor: Colors.tealAccent.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Doc Path:\n$documentPath',
              textAlign: TextAlign.center, 
            ),
            const Divider(),
            Text(
              'Temp Path:\n$tempPath',
              textAlign: TextAlign.center,
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () => readFile(),
              child: const Text('Read File'),
            ),
            Text(
              fileText,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
