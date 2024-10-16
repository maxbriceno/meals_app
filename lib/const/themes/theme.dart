import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
const kTextStyle = TextStyle(
  color: Colors.white,
);
