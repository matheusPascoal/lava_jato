import 'package:flutter/material.dart';
import 'package:lava_jato/pages/cadastro_placa.dart';
import 'package:lava_jato/pages/veiculos.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.black),
      ),
    ),
    debugShowCheckedModeBanner: false,
    home: Veiculos(),
  ));
}
