import 'package:hive_flutter/hive_flutter.dart';

class ListDB {
  List<String> RestaurantList = [];
  final _mybox = Hive.box('mybox');

  void CreateInitialData() {
    RestaurantList = ['Shawarma Corner', 'Beban', 'Revan', 'Saj Alreef'];
    UpdateData();
  }

  void LoadData() {
    //_mybox.get("List");
    RestaurantList = _mybox.get("List", defaultValue: []);
  }

  void UpdateData() {
    _mybox.put("List", RestaurantList);
  }
}
