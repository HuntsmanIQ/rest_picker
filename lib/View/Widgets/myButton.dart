import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.Textt, required this.onTap});
  VoidCallback onTap;
  String Textt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 200,
        child: Text(Textt, style: TextStyle(fontSize: 30, color: Colors.white)),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
