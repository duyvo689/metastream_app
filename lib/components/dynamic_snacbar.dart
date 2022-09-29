import 'package:flutter/material.dart';

dynamic snackBar = SnackBar(
  duration: const Duration(milliseconds: 1500),
  content: const Text("Successful Action"),
  action: SnackBarAction(
    label: 'Got it',
    onPressed: () {},
  ),
);
