import 'package:flutter/material.dart';

class ModalButtomBody extends StatelessWidget {
  ModalButtomBody(
      {super.key, required this.controller, required this.Function});

  final controller;
  VoidCallback Function;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Restaurant',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.indigo[400],
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            controller: controller,
            autofocus: true,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: Function,
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal[400],
            ),
            child: const Text(
              'Add',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
