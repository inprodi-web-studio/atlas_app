import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

DateTime dateStringToDate(String dateString) {
  return DateTime.parse(dateString);
}

String dateToHumanDate(String date) {
  // Convierte la fecha en formato "yyyy-MM-dd" a un objeto DateTime
  DateTime dateTime = DateTime.parse(date);

  // Define el formato deseado para la fecha
  final DateFormat formatoFecha = DateFormat('dd MMMM, yyyy', 'es');

  // Formatea la fecha y devuelve el resultado
  return formatoFecha.format(dateTime);
}

String hourToHumanHour(String hour) {
  // Convierte la cadena de hora en un objeto DateTime
  DateTime dateTime = DateFormat('HH:mm').parse(hour);

  // Define el formato deseado para la hora
  final DateFormat formatoHora = DateFormat('hh:mm a');

  // Formatea la hora y devuelve el resultado
  return formatoHora.format(dateTime);
}

String dateToHumanDateNoYear(String date) {
  // Convierte la fecha en formato "yyyy-MM-dd" a un objeto DateTime
  DateTime dateTime = DateTime.parse(date);

  // Define el formato deseado para la fecha
  final DateFormat formatoFecha = DateFormat('dd MMMM', 'es');

  // Formatea la fecha y devuelve el resultado
  return formatoFecha.format(dateTime);
}

int findIndex(
  List<dynamic> array,
  String? valueToSearch,
) {
  for (int i = 0; i < array.length; i++) {
    if (array[i].toString() == valueToSearch) {
      return i;
    }
  }
  // Si no se encuentra ningún `true`, puedes devolver -1 o cualquier otro valor que indique que no se encontró.
  return -1;
}

int getArrayLength(List<dynamic> array) {
  // return the length of a given array
  return array.length;
}

bool setFieldSelectable(String fieldAssociation) {
  switch (fieldAssociation) {
    case "user":
      return true;
    case "random":
      return false;
    case "noField":
      return false;
    default:
      return false;
  }
}

List<int> apiResponseToIntArray(List<String> array) {
  // receibe an array of strings and return an array of integers
  List<int> intArray = [];
  for (String str in array) {
    intArray.add(int.parse(str));
  }
  return intArray;
}

Color getStatusColor(
  String type,
  String status,
) {
  switch (status) {
    case "assisted":
      if (type == "dark") {
        return Color(0xFF389E0D);
      } else {
        return Color.fromARGB(10, 57, 158, 13);
      }

    case "noShow":
      {
        if (type == "dark") {
          return Color(0xFFCF1322);
        } else {
          return Color.fromARGB(10, 207, 19, 35);
        }
      }

    case "cancelled":
      {
        if (type == "dark") {
          return Color(0xFF979899);
        } else {
          return Color.fromARGB(10, 151, 152, 153);
        }
      }

    default:
      return Color(0xFF979899);
  }
}

List<int> returnArrayOfIntegers(List<dynamic> array) {
  // receibe an array of json and return an array of integers
  List<int> result = [];
  for (dynamic item in array) {
    if (item is int) {
      result.add(item);
    } else if (item is String) {
      result.add(int.parse(item));
    } else if (item is Map<String, dynamic>) {
      result.addAll(returnArrayOfIntegers(item.values.toList()));
    } else if (item is List<dynamic>) {
      result.addAll(returnArrayOfIntegers(item));
    }
  }
  return result;
}

String htmlToString(String htmlString) {
  // convert an html string to a simple string, removing all html tags in the original string
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  return htmlString.replaceAll(exp, ' ');
}

int dateToUnix(String date) {
  DateTime dateTime = DateTime.parse(date);

  int unixTimestamp = dateTime.millisecondsSinceEpoch;

  int unixTimestampInSeconds = unixTimestamp ~/ 1000;

  return unixTimestampInSeconds;
}

String? getFirstLastDayOfMonth(String type) {
  DateTime now = DateTime.now();

  DateTime date;

  if (type == "first") {
    date = DateTime(now.year, now.month, 1);
  } else if (type == "last") {
    date = DateTime(now.year, now.month + 1, 0);
  } else {
    return "Tipo no válido";
  }

  return DateFormat('yyyy-MM-dd').format(date);
}
