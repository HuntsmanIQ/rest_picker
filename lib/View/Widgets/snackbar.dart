import 'package:flutter/material.dart';

class ShowSnackbar {
  final String msg;
  final Duration duration;
  ShowSnackbar({required this.msg, this.duration = const Duration(seconds: 3)});

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        duration: duration,
        content: Text(
          msg,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
