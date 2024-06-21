import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStructure {
  static TextStyle heading1 = GoogleFonts.outfit(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static TextStyle heading2 = GoogleFonts.outfit(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle heading3 = GoogleFonts.outfit(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static TextStyle bodyText1 = GoogleFonts.outfit(
    fontSize: 16,
  );
  static TextStyle bodyText2 = GoogleFonts.outfit(
    fontSize: 14,
  );
  static TextStyle bodyText3 = GoogleFonts.outfit(
    fontSize: 12,
  );

  static TextStyle button = GoogleFonts.outfit(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );
  static TextStyle textField = GoogleFonts.outfit(
    fontWeight: FontWeight.w300,
    fontSize: 16,
  );
}
