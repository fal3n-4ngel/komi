import 'package:flutter/material.dart';
import 'package:komi/globals.dart';
import 'package:komi/home.dart';
import 'package:komi/anime.dart';
import 'package:komi/screens.dart';
import 'dart:ui';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class aboutui extends StatefulWidget {
  const aboutui({Key? key}) : super(key: key);

  _aboutui createState() => _aboutui();
}

class _aboutui extends State<aboutui> {
  void _show() {
    setState(() {});

    _loadQuote();
    Timer(const Duration(seconds: 2), () => setState(() {}));

    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (BuildContext ctx) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: AlertDialog(
              elevation: 10,
              title: const Text('Fetching'),
              content: image,
              actions: [],
            ),
          );
        });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _loadQuote();
  }

  _loadQuote() async {
    String url = "https://animechan.vercel.app/api/random";
    http.Response response = await http.get(Uri.parse(url));
    //Passar os dados para a UI thread
    var data = jsonDecode(response.body);
    var quote1 = data['quote'];
    anime = data['anime'];
    char = data['character'];
    quote = '$quote1';
  }

  //
  final _pageOptions = [homeui(), aboutui()];
  bool _first = true;
  double _fontSize = 16;
  Color _color = Color.fromARGB(255, 4, 4, 4);
  //
  //
  Widget build(BuildContext context) {
    double t = 0;
    double h = 184 + t;
    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 253, 253, 253),
        body: Center(
          child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Card(
                              elevation: 50,
                              shadowColor: Colors.black,
                              color: Color.fromARGB(158, 216, 216, 216),
                              child: SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 197, 214, 213),
                                        radius: 108,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "https://external-preview.redd.it/FIq9t60PKw-02SdfXqgo3llm6E1g2fD79Z1_vPJ3guk.png?auto=webp&s=402852a09557e3eed31b793fec91109e04e11401"),
                                          radius: 100,
                                        ),
                                      ),
                                      Text(
                                        "\n '$quote'",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontFamily: 'Actor',
                                            fontSize: 20,
                                            letterSpacing: -0.4099999964237213,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                      Text(
                                        '\n $char',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontFamily: 'Comfortaa',
                                            fontSize: 20,
                                            letterSpacing: -0.4099999964237213,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 20),
                              width: 100,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  primary: Colors.white, //Text Color
                                  backgroundColor: Color.fromARGB(
                                      141, 0, 0, 0), //Button Background Color
                                ),
                                onPressed: () {
                                  _loadQuote();
                                  setState(() {});
                                  _show();
                                  Timer(const Duration(seconds: 2),
                                      () => Navigator.pop(context));

                                  setState(() {});
                                },
                                child: Text("Refresh"),
                              ))
                        ])
                  ])),
        ));
  }
}
