import 'package:flutter/material.dart';

const dividerLine = Color(0xffE4E4EE);
const cardColor = Color(0xffE9ECF1);

const textColorBack = Color(0xff171717);

const firstGradientColor = Color(0xff408ADE);

const secondGradientColor = Color(0xff5286CD);

const primaryColor = Color.fromARGB(255, 134, 107, 252);
const dayColor = Color.fromARGB(255, 255, 154, 3);
const secondaryColor = Color(0xffa1c6fd);
const tertiaryColor = Color(0xff000000);
const greyColor = Color(0xffd9dadb);
const whiteColor = Color(0xffffffff);
final shader = const LinearGradient(
        colors: [Color(0xffABcff2), Color.fromARGB(255, 75, 111, 147)])
    .createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

const linearGradientBlue = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.topLeft,
    colors: [Color(0xffABcff2), Color.fromARGB(255, 101, 156, 211)],
    stops: [0.0, 1.0]);

const linearGradientPurple = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [Color(0xff51087e), Color.fromARGB(255, 120, 1, 195)],
    stops: [0.0, 1.0]);
