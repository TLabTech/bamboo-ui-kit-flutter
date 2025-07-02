import 'package:flutter/material.dart';

// Base Colors
String baseBlack = '121212';
String baseWhite = 'FFFFFF';

// Primary Colors
String primary050 = 'EAFFF6';
String primary100 = 'CDFEE7';
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
String secondary600 = '0078D0';
String secondary700 = '005FA8';
String secondary800 = '01518B';
String secondary900 = '074373';
String secondary950 = '052B4C';

// Gray Colors
String gray050 = 'F6F7F9';
String gray100 = 'EDEFF1';
String gray200 = 'D6DAE1';
String gray300 = 'B2BAC7';
String gray400 = '8995A7';
String gray500 = '677489';
String gray600 = '556074';
String gray700 = '454E5F';
String gray800 = '3C4350';
String gray900 = '353A45';
String gray950 = '23272E';

// red Colors
String red050 = 'FEF3F2';
String red100 = 'FDE5E3';
String red200 = 'FCCFCC';
String red300 = 'F9ADA8';
String red400 = 'F47D75';
String red500 = 'E8463B';
String red600 = 'D6372C';
String red700 = 'B42A21';
String red800 = '95271F';
String red900 = '7C2620';
String red950 = '430F0C';

// green Colors
String green050 = 'EEFBF4';
String green100 = 'D6F5E2';
String green200 = 'B0EACA';
String green300 = '7CD9AC';
String green400 = '47C08A';
String green500 = '25AB73';
String green600 = '168559';
String green700 = '126A49';
String green800 = '10553B';
String green900 = '0E4632';
String green950 = '07271C';

// Yellow Colors
String yellow050 = 'FDF8E9';
String yellow100 = 'FBF7C6';
String yellow200 = 'F9E6B8';
String yellow300 = 'F5D84F';
String yellow400 = 'F0C81F';
String yellow500 = 'ECB913';
String yellow600 = 'C1890D';
String yellow700 = '9A620E';
String yellow800 = '804E13';
String yellow900 = '6D4016';
String yellow950 = '3F2009';

// Blue Colors
String blue050 = 'EFF5FF';
String blue100 = 'DBE7FE';
String blue200 = 'BFD6FE';
String blue300 = '92BCFE';
String blue400 = '5F99FB';
String blue500 = '3670F7';
String blue600 = '2453EC';
String blue700 = '1C3ED9';
String blue800 = '1D34B0';
String blue900 = '1D318B';
String blue950 = '172054';

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
