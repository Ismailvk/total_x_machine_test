import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static final TextStyle montesserateHeading =
      GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 16);

  static final TextStyle montesserateGrey =
      GoogleFonts.montserrat(color: const Color.fromARGB(255, 127, 127, 127));

  static const TextStyle normalBold =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}
