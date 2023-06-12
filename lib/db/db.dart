import 'package:hive_flutter/hive_flutter.dart';
part 'db.g.dart';

@HiveType(typeId: 1)
class db {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? sub;
  @HiveField(2)
   final String img;
  db({required this.title, required this.sub, required this.img});
}
