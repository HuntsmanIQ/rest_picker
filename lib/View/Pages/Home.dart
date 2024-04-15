import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_picker/View/Widgets/myButton.dart';
import 'dart:math';
import 'package:rest_picker/View/Widgets/snackbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String Restaurant = '';

  //Function to Select Restaurant Randomly
  void getRandomRestaurant() {
    if (selectedRestaurant.isEmpty) {
      setState(() {
        Restaurant = '';
      });
      ShowSnackbar(msg: 'Please Select Restaurants First !')
          .showSnackBar(context);
    } else if (selectedRestaurant.length > 1) {
      final random = Random();
      var element =
          selectedRestaurant[random.nextInt(selectedRestaurant.length)];
      setState(() {
        Restaurant = element;
      });
    } else {
      ShowSnackbar(
        msg: 'صـاير لوتي حبيبي ؟؟',
        duration: const Duration(seconds: 2),
      ).showSnackBar(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(height: 40),
        Container(
          alignment: Alignment.center,
          height: 200,
          width: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.withOpacity(0.03)),
          child: Text(
            Restaurant,
            style: GoogleFonts.maidenOrange(
                textStyle: const TextStyle(
                    fontSize: 50, color: Color.fromARGB(255, 224, 140, 5))),
          ),
        ),
        const SizedBox(height: 40),
        MyButton(Textt: 'Pick', onTap: getRandomRestaurant),
        const SizedBox(height: 20),
        MyButton(
            Textt: 'Selected',
            onTap: () => Navigator.of(context).pushNamed('Selected')),
        const SizedBox(height: 20),
        const Spacer(),
      ]),
    );
  }
}

List<String> selectedRestaurant = [];
