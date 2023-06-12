import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_2023/db/db.dart';
import 'package:todo_2023/main.dart';

class dbprovider extends ChangeNotifier {
  List<db> dblist = [];
  List get db_lst => dblist;
  Future<void> read() async {
    final dbs = await Hive.openBox<db>(hv);
    dblist.clear();

    dblist.addAll(dbs.values);
    notifyListeners();
  }

 
  Future<void> add(db values) async {
    var dbs = await Hive.openBox<db>(hv);
    await dbs.add(values);

    read();
  }

  delete(int index) async {
    final dbs = await Hive.openBox<db>(hv);
    await dbs.deleteAt(index);
    read();
  }

  putval(int index, db val) async {
    final dbs = await Hive.openBox<db>(hv);
    dbs.putAt(index, val);
    read();
  }

  File? _imagepicker;
  File? get picker => _imagepicker;

  getimagepicker() async {
    final image = ImagePicker();

    final pick = await image.pickImage(source: ImageSource.gallery);

    if (pick != null) {
      final imagepicker = File(pick.path);
      _imagepicker = imagepicker;
    } else {
      return;
    }

    notifyListeners();
  }

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
}
