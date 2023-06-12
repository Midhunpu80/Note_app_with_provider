// ignore_for_file: unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_2023/colors.dart';
import 'dart:math' as math;

import 'package:todo_2023/controller/controller.dart';
import 'package:todo_2023/db/favDb/favdb.dart';
import 'package:todo_2023/models/fav.dart';
import 'package:todo_2023/models/functions.dart';
import 'package:todo_2023/view.dart/screens/noteread.dart';
import 'package:todo_2023/widget/bottomsheet.dart';

final rnd = math.Random();

Color getRandomColor() => Color(rnd.nextInt(0xffffffff));

class grid_notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    // final provider = Provider.of<providerfunction>(context, listen: false);
    final provi = Provider.of<dbprovider>(context, listen: false);
    final provis = Provider.of<favlist>(context, listen: false);
    provi.read();

    return SizedBox(
      height: 550,
      child: Consumer<dbprovider>(builder: (context, value, child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 14, mainAxisSpacing: 14),
          itemBuilder: (context, index) {
            final data = provi.dblist[index];

            return InkWell(
              onTap: () {
              
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => note_readscreen(
                          name: data.title!,
                          sub: data.sub!,
                          img: data.img,
                          index: index,
                        )));
              },
              child: Container(
                height: 200,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                  color: getRandomColor(),
                ),
                child: Consumer<favlist>(builder: (context, val, child) {
                  return ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                          var s =      fdb(name: data.title, subtitle: data.sub, imges: data.img);
                              val.addfav(s,index.toString());
                            },
                            icon: Icon(Icons.favorite),
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IconButton(
                                onPressed: () {
                                  botsheet(context, index, data.title!,
                                      data.img, data.sub!);
                                },
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          data.title.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          data.sub.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          maxLines: 4,
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Container(
                        height: 400,
                        width: 100,
                        color: Colors.red,
                        child: Image(
                          image: FileImage(
                            File(data.img),
                          ),
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  );
                }),
              ),
            );
          },
          itemCount: provi.db_lst.length,
        );
      }),
    );
  }
}
