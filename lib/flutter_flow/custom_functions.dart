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

bool showSearchResult(
  String textSearchFor,
  String textSearchIn,
) {
  return textSearchIn.toLowerCase().contains(textSearchFor.toLowerCase());
}

String? calcAge(DateTime? from) {
  final current = DateTime.now();
  // calculate the current age using dob and current datetime.
  if (from == null || current == null) {
    return null;
  }
  final age = current.year - from.year;
  if (current.month < from.month ||
      (current.month == from.month && current.day < from.day)) {
    return (age - 1).toString();
  }
  return age.toString();
}
