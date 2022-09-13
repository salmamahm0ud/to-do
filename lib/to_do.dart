import 'package:flutter/cupertino.dart';

class ToDo extends ChangeNotifier {
  List? toDo = [
    'wake at 5:00',
    'wake at 5:00',
    'wake at 5:00',
    'wake at 5:00',
  ];

  addtoToDo(String val) {
    toDo!.add(val);
    print(val);
    notifyListeners();
  }
}
