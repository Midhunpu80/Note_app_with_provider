// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_2023/db/favDb/favdb.dart';
import 'package:todo_2023/main.dart';

class favlist extends ChangeNotifier {
  List<String> favourites = [];
  List get fav_ourites => favourites;
  Future<void> addfav(fdb indexx, String index) async {
    var fdbs = await Hive.openBox<fdb>(hb);
    await fdbs.add(indexx);
    favourites.add(indexx.toString());
  }

  Future<void> deltefav(int index) async {
    var fdbs = await Hive.openBox<fdb>(hb);
    await fdbs.deleteAt(index);
    favourites.removeAt(index);
  }
}
