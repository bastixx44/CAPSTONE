import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<DateTime> listaDeHoras(
  DateTime horaInicio,
  DateTime horaCierre,
) {
  // crea una funcion donde el usuario ingrese dos variables de tipo datetime y que luego se almacenaran en una lista
  return [horaInicio, horaCierre];
}

DateTime stringADataTime(String hora) {
  // passing a string of type 08:00 return it  date time
  final now = DateTime.now();
  final parts = hora.split(':');
  final hour = int.parse(parts[0]);
  final minute = int.parse(parts[1]);
  return DateTime(now.year, now.month, now.day, hour, minute);
}
