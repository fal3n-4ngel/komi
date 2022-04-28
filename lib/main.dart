import 'package:flutter/material.dart';
import 'package:komi/screens.dart';
import 'dart:async';
import 'package:komi/globals.dart';
import 'package:komi/home.dart';
import 'package:komi/about.dart';

void main() {
  runApp(const MyApp());
}

// Main //
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

// Main Screen Setup//
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  final String title = 'Komi';
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Splash Screen Setup//
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override // Splash Screen Screen //
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Container(
          alignment: Alignment.center,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Stack(children: <Widget>[
            image,
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 540),
              child: const Text(
                "Komi's Choice",
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'NovaSlim',
                    fontSize: 36,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ),
          ])),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageOptions = [const homeui(), const aboutui()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.code, size: 30), label: 'About'),
          ],
          selectedItemColor: Colors.black,
          elevation: 5.0,
          unselectedItemColor: Colors.black54,
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }
}
