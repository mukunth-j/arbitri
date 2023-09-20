import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kWhiteText = GoogleFonts.nunito(
  color: kWhiteColor,
);

const kWhiteColor = Color(0xFFd9d9e3);
const kPrimaryColor = Color(0xFF10A37F);

const kBg500Color = Color(0xFF202123);
const kBg300Color = Color(0xFF222528);
const kBg100Color = Color(0xff272d31);

const kMedium = FontWeight.w500;
const kRegular = FontWeight.w400;
const kSemiBold = FontWeight.w600;

// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';

// class ThemeClass {
//   Color textBoxColor = const Color(0xFFF7F8F9);
//   Color lightPrimaryColor = HexColor('#DF0054');
//   Color darkPrimaryColor = HexColor('#480032');
//   Color secondaryColor = HexColor('#FF8B6A');
//   Color accentColor = HexColor('#FFD2BB');
//   Color lightFontColor = Colors.black;
//   Color lightSecFontColor = Color(0xFF6A707C);
//   Color lightTBFontColor = Color(0xFF8391A1);
//   Color lightBtnColor = Color(0xFF1E232C);
//   Color darkBtnColor = Color(0xFF000000); // Set your dark button color here
//   Color lightBtnFontColor = Colors.white;

//   static ThemeData lightTheme = ThemeData(
//     primaryColor: ThemeData.light().scaffoldBackgroundColor,
//     colorScheme: const ColorScheme.light().copyWith(
//       primary: _themeClass.lightPrimaryColor,
//       secondary: _themeClass.secondaryColor,
//     ),
//     //buttonColor: _themeClass.lightBtnColor, // Set the button color for the light theme
//   );

//   static ThemeData darkTheme = ThemeData(
//     primaryColor: ThemeData.dark().scaffoldBackgroundColor,
//     colorScheme: const ColorScheme.dark().copyWith(
//       primary: _themeClass.darkPrimaryColor,
//       secondary: _themeClass.secondaryColor,
//     ),
//     //buttonColor: _themeClass.darkBtnColor, // Set the button color for the dark theme
//   );
// }

// ThemeClass _themeClass = ThemeClass();
