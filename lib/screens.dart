// ignore_for_file: avoid_print, file_names, camel_case_types, duplicate_ignore, prefer_const_literals_to_create_immutables, non_constant_identifier_names, annotate_overrides, prefer_const_constructors, unused_field, prefer_final_fields
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:komi/globals.dart';
import 'package:komi/home.dart';
import 'package:komi/anime.dart';
import 'package:komi/about.dart';
import 'dart:ui';
import 'dart:async';

class animui extends StatefulWidget {
  const animui({Key? key}) : super(key: key);

  _animui createState() => _animui();
}

class _animui extends State<animui> {
  //
  final _pageOptions = [homeui(), aboutui()];
  bool _first = true;
  double _fontSize = 16;
  Color _color = Color.fromARGB(255, 4, 4, 4);
  //
  //
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
          child: Column(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      padding: EdgeInsets.only(top: 0, bottom: 0),
                      width: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        color: Color.fromRGBO(246, 245, 245, 1),
                      ),
                      child: Stack(children: <Widget>[
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                                width: 400,
                                height: 400,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(imgl),
                                      fit: BoxFit.fitWidth),
                                ))),
                        Positioned(
                            top: 350,
                            left: 0,
                            right: 0,
                            child: Container(
                                width: 380,
                                height: 420,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                  ),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ))),
                        Positioned(
                            top: 383,
                            left: 15,
                            child: Text(
                              ename,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(45, 12, 87, 1),
                                  fontFamily: 'Actor',
                                  fontSize: 36,
                                  letterSpacing: 0.4099999964237213,
                                  fontWeight: FontWeight.normal,
                                  height: 1.1388888888888888),
                            )),
                        Positioned(
                            top: 468,
                            left: 15,
                            child: Container(
                              decoration: BoxDecoration(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    '$score',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(149, 134, 168, 1),
                                        fontFamily: 'Abyssinica SIL',
                                        fontSize: 24,
                                        letterSpacing: -0.8029167056083679,
                                        fontWeight: FontWeight.normal,
                                        height: 1.795138994852702),
                                  ),
                                ],
                              ),
                            )),
                        Positioned(
                            top: 440,
                            left: 15,
                            child: Text(
                              nname,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(45, 12, 87, 1),
                                  fontFamily: 'Actor',
                                  fontSize: 22,
                                  letterSpacing: -0.4099999964237213,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Container(
                          padding:
                              EdgeInsets.only(top: 540, left: 10, right: 10),
                          child: Text(
                            desc,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(45, 12, 87, 1),
                                fontFamily: 'Comfortaa',
                                fontSize: 20,
                                letterSpacing: -0.4099999964237213,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ])))
            ],
          )),
    );
  }
}
