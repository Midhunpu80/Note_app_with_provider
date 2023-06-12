import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_2023/db/favDb/favdb.dart';
import 'package:todo_2023/models/fav.dart';
import 'package:todo_2023/models/functions.dart';
import 'package:todo_2023/view.dart/screens/noteread.dart';
import 'package:todo_2023/widget/bottomsheet.dart';

final rnd = math.Random();

Color getRandomColor() => Color(rnd.nextInt(0xffffffff));

class favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<favlist>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 850,
            child: Consumer<favlist>(builder: (context, value, child) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14),
                itemBuilder: (context, index) {
             var data= prov.fav_ourites[index];
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      height: 200,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        color: getRandomColor(),
                      ),
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 130),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              value.fav_ourites[index],
                              style:const  TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                         Padding(
                            padding:const  EdgeInsets.all(10.0),
                            child: Text(
                           value.fav_ourites[index].toString(),
                              style:const  TextStyle(
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
                                File(value.fav_ourites[index]),
                              ),
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: value.fav_ourites.length,
              );
            }),
          ),
        ),
      ),
    );
  }
}
