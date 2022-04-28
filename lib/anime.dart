import 'package:flutter/material.dart';
import 'package:anilist/anilist.dart';

import 'dart:async';
import 'package:komi/globals.dart';

void anim(name) async {
  Timer(const Duration(seconds: 4),
      () => image1 = Image.asset('assets/home1.gif'));
  final request = AnilistMediaRequest();
  request.withDescription();
  request.withCoverImage();
  request.withChapters();
  request.withAverageScore();
  request.withTitleNative();
  request.withTitleEnglish();

  ename = name;
  request.querySearch(name);
  print(request);
  var media = await request.list(1, 1);
  var desc1 = media.results?.toList();
  score = desc1![0].averageScore;
  if (score == null) {
    score = '';
  } else {
    score = ' $score% \u2661';
  }

  var nname1 = desc1[0].title?.native;
  var ename1 = desc1[0].title?.english;
  ename = '$ename1';
  if (ename == 'null') {
    ename = name;
  }
  nname = '$nname1';
  nname = nname;
  try {
    desc = desc1[0].description!.replaceAll('<br>', '');
  } on Exception catch (_) {
    desc = desc1[0].description!;
  }
  desc = desc.replaceAll('<b>', '');
  desc = desc.replaceAll('</b>', '');
  desc = desc.replaceAll('</i>', '');
  desc = desc.replaceAll('<i>', '');
  var imgl1 = desc1[0].coverImage?.large;
  imgl = '$imgl1';
  image3 = Image.network(imgl);
}
