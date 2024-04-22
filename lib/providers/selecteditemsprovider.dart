import 'package:flutter/material.dart';

class SelectedItemsProvider with ChangeNotifier {
  final List<int> _selecteditems = [];

  List<int> get selecteditems => _selecteditems;

  void additeminsellist(int selvalue) {
    _selecteditems.add(selvalue);
    notifyListeners();
  }

  void deleteditemlist(int delvalue) {
    _selecteditems.remove(delvalue);
    notifyListeners();
  }
}
