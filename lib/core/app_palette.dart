import 'package:flutter/material.dart';

abstract class AppPalette {
  AppPalette._();

  // ── Sky 
  static const sky50    = Color(0xFFE0F2FE);
  static const sky50a40 = Color(0x66E0F2FE); // sky50 @ 40% opacity
  static const sky50a10 = Color(0x1AE0F2FE); // sky50 @ 10% opacity
  static const sky100 = Color(0xFFC8E8F7);
  static const sky200 = Color(0xFFB8DFF0); 
  static const sky300 = Color(0xFFA0D8EF);
  static const sky400 = Color(0xFF7BC4E0);
  static const sky500 = Color(0xFF5AABD2); 

  // ── Light Neutral 
  static const white   = Color(0xFFFFFFFF);
  static const black   = Color(0xFF000000);
  static const gray50  = Color(0xFFF8F9FB);
  static const gray75  = Color(0xFFF5F7F8);
  static const gray100 = Color(0xFFF0F2F3);
  static const gray150 = Color(0xFFE8EAEC);
  static const gray200 = Color(0xFFEAECEE);
  static const gray300 = Color(0xFFDDE1E3);
  static const gray400 = Color(0xFFC2C9CC);
  static const gray500 = Color(0xFF9BA4A8);
  static const gray600 = Color(0xFF697477);
  static const gray700 = Color(0xFF3C4447);
  static const gray800 = Color(0xFF1A1A1A);

  // ── Dark Surface (neutral gray) 
  static const dark50  = Color(0xFF242424); 
  static const dark100 = Color(0xFF1C1C1C); 
  static const dark150 = Color(0xFF1A1A1A); 
  static const dark200 = Color(0xFF111111);
  static const dark300 = Color(0xFF222222);
  static const dark350 = Color(0xFF262626); 
  static const dark400 = Color(0xFF2C2C2C); 
  static const dark450 = Color(0xFF3A3A3A); 
  static const dark500 = Color(0xFF4A4A4A); 
  static const dark600 = Color(0xFF6E6E6E); 
  static const dark700 = Color(0xFF969696);
  static const dark800 = Color(0xFFC0C0C0);

  // ── Status 
  static const red400   = Color(0xFFE53935);
  static const red500   = Color(0xFFFF5252);
  static const amber400 = Color(0xFFF9A825);
  static const amber500 = Color(0xFFFFD740);
  static const green400 = Color(0xFF43A047);
  static const green500 = Color(0xFF69F0AE);

  // ── Extended 
  static const blue700        = Color(0xFF0059B9);
  static const redContainer   = Color(0xFFFFDAD6);
  static const onRedContainer = Color(0xFF410002);
  static const warmGray700    = Color(0xFF3C3F3E);
  static const cream100       = Color(0xFFEFEDED);
}
