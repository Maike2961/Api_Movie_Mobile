import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

TextStyle style(){
  return const TextStyle(
    color: Colors.red,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 2,
  );
}

String data(String value){
  DateTime temp = DateTime.parse(value);

  String dataformado = DateFormat("dd/MM/yyyy").format(temp);

  return dataformado;
}