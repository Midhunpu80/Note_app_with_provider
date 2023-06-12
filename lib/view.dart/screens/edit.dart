import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_2023/db/db.dart';
import 'package:todo_2023/models/functions.dart';

class editing extends StatelessWidget {
  int? index;
  String? text;
  String? sub;
  String img;
  editing(
      {required this.text,
      required this.sub,
      required this.img,
      required this.index});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final provider = Provider.of<dbprovider>(context, listen: false);
    provider.controller1 = TextEditingController(text: text);
    provider.controller2 = TextEditingController(text: sub);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                if (provider.picker != null) {
                  save(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Color.fromARGB(255, 0, 255, 8),
                      content: Text("Saved")));
                } else {
                  return;
                }

                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.save,
                color: Colors.white,
              ))
        ],
        toolbarHeight: 100,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
      ),
      body: Consumer<dbprovider>(builder: (context, value, child) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: provider.controller1,
                keyboardType: TextInputType.text,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    hintText: "Enter the title",
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color.fromARGB(71, 139, 139, 139),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              width: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: provider.controller2,
                  cursorColor: Colors.white,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      hintText: "Enter the subtititle",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Color.fromARGB(68, 139, 139, 139),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
                bottom: 10,
              ),
              child: Text(
                "Add your image",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 300,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(41, 152, 146, 127),
                ),
                child: Stack(
                  children: [
                    value.picker == null
                        ? const SizedBox(
                            height: 50,
                            width: 50,
                          )
                        : Center(
                            child: SizedBox(
                              child: Image(
                                  image: FileImage(File(value.picker!.path))),
                            ),
                          ),
                    Center(
                      child: IconButton(
                          onPressed: () {
                            value.getimagepicker();
                          },
                          icon: const Icon(
                            Icons.image,
                            size: 55,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  void save(BuildContext context) {
    //  final provider = Provider.of<dbprovider>(context, listen: false);

    final provid = Provider.of<dbprovider>(context, listen: false);
    final con1 = provid.controller1.text.trim();
    final con2 = provid.controller2.text.trim();

    if (con1.isEmpty || con2.isEmpty || img.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text(" is empty")));
    } else {
      dynamic dbs = db(title: con1, sub: con2, img: provid.picker!.path ?? img);
      provid.putval(index!, dbs);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromARGB(255, 0, 255, 8),
          content: Text("Updated")));
    }
  }
}
