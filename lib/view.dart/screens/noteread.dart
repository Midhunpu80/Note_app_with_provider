import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:provider/provider.dart';
import 'package:todo_2023/models/functions.dart';
import 'package:todo_2023/widget/bottomsheet.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

class note_readscreen extends StatelessWidget {
  String name;
  String sub;
  String img;
  int index;

  note_readscreen({required this.name, required this.sub, required this.img,required this.index});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<dbprovider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                botsheet(context, index, name, img, sub);
              },
              icon: const Icon(Icons.more_vert,color: Colors.white,)),
        ],
        centerTitle: true,
        title: const Text(
          "Notes",
          style: TextStyle(color: Colors.white),
        ),
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            SizedBox(
                child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 25),
            )),
            SizedBox(
                child: Text(
              sub,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              maxLines: null,
            )),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                height: 500,
                width: 500,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ZoomOverlay(
                    modalBarrierColor: Colors.black12, // Optional
                    minScale: 0.5, // Optional
                    maxScale: 3.0, // Optional
                    animationCurve: Curves
                        .fastOutSlowIn, // Defaults to fastOutSlowIn which mimics IOS instagram behavior
                    animationDuration: const Duration(
                        milliseconds:
                            300), // Defaults to 100 Milliseconds. Recommended duration is 300 milliseconds for Curves.fastOutSlowIn
                    twoTouchOnly: true, // Defaults to false
                    onScaleStart: () {}, // optional VoidCallback
                    onScaleStop: () {}, //

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        File(img),
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
