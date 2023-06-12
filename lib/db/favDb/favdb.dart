import 'package:hive_flutter/hive_flutter.dart';
part 'favdb.g.dart';

@HiveType(typeId: 2)
class fdb {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? subtitle;
  @HiveField(2)
  final String imges;
  fdb({required this.name, required this.subtitle, required this.imges});
}
