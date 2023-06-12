import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_2023/controller/controller.dart';
import 'package:todo_2023/db/db.dart';
import 'package:todo_2023/models/fav.dart';
import 'package:todo_2023/models/functions.dart';
import 'package:todo_2023/view.dart/home.dart';

import 'db/favDb/favdb.dart';

String hv = "HIVEDB";
String hb = "HIVEDBs";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!Hive.isAdapterRegistered(dbAdapter().typeId)) {
    Hive.registerAdapter(dbAdapter());
  }
  if (!Hive.isAdapterRegistered(fdbAdapter().typeId)) {
    Hive.registerAdapter(fdbAdapter());
  }

  await Hive.initFlutter();

  /// await Hive.openBox<dbprovider>(hv);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<providerfunction>(create: (_) => providerfunction()),
    ChangeNotifierProvider<dbprovider>(create: (_) => dbprovider()),
    ChangeNotifierProvider<favlist>(create: (_) => favlist()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: home(),
      ),
    );
  }
}
