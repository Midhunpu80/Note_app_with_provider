// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_2023/models/functions.dart';
import 'package:todo_2023/view.dart/home.dart';

Alert(BuildContext context, int index) {
  final prove = Provider.of<dbprovider>(context, listen: false);
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Delete",
            style: TextStyle(color: Colors.black),
          ),
          content: const Text("if you want to delete"),
          actions: [
            TextButton(
                onPressed: () {
                  prove.delete(index);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>home()));
                },
                child: const Text("yes")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("No"))
          ],
        );
      });
}
