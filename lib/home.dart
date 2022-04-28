import 'package:flutter/material.dart';
import 'package:komi/globals.dart';
import 'package:komi/anime.dart';
import 'dart:ui';
import 'dart:async';
import 'package:komi/screens.dart';

class homeui extends StatefulWidget {
  const homeui({Key? key}) : super(key: key);

  @override
  _homeui createState() => _homeui();
}

class _homeui extends State<homeui> {
  Image image2 = Image.asset('assets/home3.gif');
  void _show() {
    setState(() {});

    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (BuildContext ctx) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: AlertDialog(
              elevation: 10,
              title: const Text('Fetching'),
              content: image2,
              actions: [],
            ),
          );
        });
    setState(() {});
  }

  TextEditingController AniCont = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
          child: Column(children: [
            //                            //
            //  Heading 1 'Komi's Choice' //
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 20, left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Text(
                  "Komi's Choice",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'NovaSlim',
                      fontSize: 36,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            //                            //
            //  Heading 1 'Komi's Choice' //
            Container(
              width: 300,
              color: Color.fromARGB(255, 255, 255, 255),
              padding: EdgeInsets.only(top: 30, bottom: 20),
              child: TextField(
                controller: AniCont,
                textInputAction: TextInputAction.search,
                onSubmitted: (value) async {
                  var ani = AniCont.text;
                  anim(ani);
                  _show();

                  Timer(
                      const Duration(seconds: 3),
                      () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const animui())));
                  setState(() {});
                  setState(() {});
                  setState(() {});
                },
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(138, 182, 182, 182),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide.none,
                  ),
                  labelText: 'Search Anime',
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
            ),
            image4,
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 20, left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Text(
                  '',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'NovaSlim',
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
          ])),
    );
  }
}
