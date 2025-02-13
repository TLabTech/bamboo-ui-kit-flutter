import 'package:flutter/material.dart';

// Neutral Colors
String neutral050 = 'F6F7F9';
String neutral100 = 'EDEFF1';
String neutral200 = 'D6DAE1';
String neutral300 = 'B2BAC7';
String neutral400 = '8995A7';
String neutral500 = '677489';
String neutral600 = '556074';
String neutral700 = '454E5F';
String neutral800 = '3C4350';
String neutral900 = '353A45';
String neutral950 = '23272E';

// Primary Colors
String primary050 = 'EAFFF6';
String primary100 = 'CDFEEF';
String primary200 = 'A0FAD4';
String primary300 = '63F2BE';
String primary400 = '25E2A3';
String primary500 = '00D89C';
String primary600 = '00A474';
String primary700 = '008360';
String primary800 = '00674E';
String primary900 = '005541';
String primary950 = '003026';

// Secondary Colors
String secondary050 = 'EFF8FF';
String secondary100 = 'DFE0FF';
String secondary200 = 'B7E2FF';
String secondary300 = '77CBFF';
String secondary400 = '2FB1FF';
String secondary500 = '049CFB';
String secondary600 = '007B00';
String secondary700 = '005FA8';
String secondary800 = '01518B';
String secondary900 = '074373';
String secondary950 = '052B4C';

// Danger Colors
String danger050 = 'FEF3F2';
String danger100 = 'FDE5E3';
String danger200 = 'FCCFCC';
String danger300 = 'F9ADA8';
String danger400 = 'F47D75';
String danger500 = 'E4683B';
String danger600 = 'D6372C';
String danger700 = 'B42A21';
String danger800 = '952F1F';
String danger900 = '7C2620';
String danger950 = '430F0C';

// Success Colors
String success050 = 'EEFBF4';
String success100 = 'D6F5E2';
String success200 = 'B0EACA';
String success300 = '7CD9AC';
String success400 = '47C08A';
String success500 = '25AB73';
String success600 = '168559';
String success700 = '126A49';
String success800 = '10553B';
String success900 = '0E4632';
String success950 = '07271C';

// Warning Colors
String warning050 = 'FDF8E9';
String warning100 = 'FBF7C6';
String warning200 = 'F9E6B8';
String warning300 = 'F5D84F';
String warning400 = 'F0C81F';
String warning500 = 'ECB913';
String warning600 = 'C1890D';
String warning700 = '9A620E';
String warning800 = '804E13';
String warning900 = '6D4016';
String warning950 = '3F2009';

// Info Colors
String info050 = 'FEFFFF';
String info100 = 'DBE7FE';
String info200 = 'BFD6FF';
String info300 = '92BCFE';
String info400 = '5F99FB';
String info500 = '3F67F7';
String info600 = '2453EC';
String info700 = '1C3ED9';
String info800 = '1D3480';
String info900 = '1D318B';
String info950 = '172054';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
