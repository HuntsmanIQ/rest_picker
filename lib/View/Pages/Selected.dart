import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rest_picker/View/Widgets/modalButtomBody.dart';
import 'package:rest_picker/View/Widgets/snackbar.dart';
import 'package:rest_picker/Model/DataBase/database.dart';
import 'Home.dart';
import 'package:get/get.dart';

class NameSelector extends StatefulWidget {
  @override
  _NameSelectorState createState() => _NameSelectorState();
}

class _NameSelectorState extends State<NameSelector> {
  TextEditingController controller = TextEditingController();

  void toggleRestaurantSelection(String name) {
    setState(() {
      if (selectedRestaurant.contains(name)) {
        selectedRestaurant.remove(name);
      } else {
        selectedRestaurant.add(name);
      }
    });
  }

  void removeRestaurant(int index) {
    setState(() {
      db.RestaurantList.removeAt(index);
      db.UpdateData();
    });
  }

  final _mybox = Hive.box('mybox');
  ListDB db = ListDB();
  @override
  void initState() {
    if (_mybox.get("List") == null) {
      db.CreateInitialData();
    } else {
      db.LoadData();
    }
    super.initState();
  }

//Checks SelectedRestaurantList
  void CheckSelected() {
    if (selectedRestaurant.length > 1) {
      Navigator.of(context).pop();
    } else if (selectedRestaurant.length == 1) {
      ShowSnackbar(msg: 'Please Chose more than one Restaurant !')
          .showSnackBar(context);
    } else {
      ShowSnackbar(msg: 'Please Select Two or more Restaurants !')
          .showSnackBar(context);
    }
  }

//Checks TextField and Add Restaurant to Selected List
  void AddRestaurant() {
    if (controller.text.isEmpty) {
      //Snackbar for null
      setState(() {
        ShowSnackbar(msg: 'Enter Restaurant name First !')
            .showSnackBar(context);
      });
    } else {
      setState(() {
        db.RestaurantList.add(controller.text);
        db.UpdateData();
      });

      controller.clear();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          'Restaurant Selector',
          style: GoogleFonts.lobster(textStyle: TextStyle(fontSize: 30)),
        ),
      )),
      body: Column(children: [
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: db.RestaurantList.length,
            itemBuilder: (BuildContext context, int index) {
              final name = db.RestaurantList[index];
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Slidable(
                    actionPane: const SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    actions: <Widget>[
                      Container(
                          height: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 222, 79, 79),
                          ),
                          child: IconButton(
                            color: Colors.black,
                            icon: const Icon(Icons.delete),
                            onPressed: () => removeRestaurant(index),
                          )),
                    ],
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.amber.withAlpha(250),
                          borderRadius: BorderRadius.circular(10)),
                      child: CheckboxListTile(
                        activeColor: Color.fromARGB(255, 236, 150, 3),
                        title: Text(
                          name,
                          style: const TextStyle(
                              fontFamily: "Default",
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        value: selectedRestaurant.contains(name),
                        onChanged: (bool? value) {
                          toggleRestaurantSelection(name);
                        },
                      ),
                    ),
                  ));
            },
          ),
        ),
        const SizedBox(height: 50),
        GestureDetector(
          onTap: () => CheckSelected(),
          child: Container(
            alignment: Alignment.center,
            width: 200,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.indigoAccent.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12)),
            child: const Text(
              'Confirm',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        const SizedBox(height: 20),
        FloatingActionButton(
            backgroundColor: Colors.indigoAccent.withOpacity(0.5),
            child: const Icon(size: 40, Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        ModalButtomBody(
                            controller: controller, Function: AddRestaurant),
                      ],
                    );
                  });
            }),
      ]),
    );
  }
}
