import 'package:flutter/widgets.dart';
import 'package:hiring_roof/data/shared_pref.dart';
import '../../model/verify.dart';

late SharedPref sharedPref;
Verify userModal = Verify();
bool phone = true;

const String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTRkZjI4ZDVjNDI2YzQ3YzM1YzI5YzYiLCJpYXQiOjE3MDAxMjMwNTksImV4cCI6MTcwNTMwNzA1OX0.H7pG4ZypYDDw5xoL5EatrrZh-R36RsGRUoE0vpxYObU";
Size screenSize = const Size(700, 1570);
