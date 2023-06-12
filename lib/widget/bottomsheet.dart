
import 'package:flutter/material.dart';
import 'package:todo_2023/view.dart/screens/edit.dart';
import 'package:todo_2023/widget/alertdialog.dart';

botsheet(BuildContext context, int index,  String titile, String img ,String sub ) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 255, 255, 255)),
          child: Column(
            children: [
              IconButton(
                  onPressed: () {
                    Alert(context, index);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => editing(
                            text: titile, sub: sub, img: img, index: index)));
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.red,
                  ))
            ],
          ),
        );
      });
}
