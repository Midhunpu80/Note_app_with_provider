import 'package:flutter/material.dart';
import 'package:todo_2023/view.dart/screens/favorites.dart';
import 'package:todo_2023/view.dart/screens/gridnotes.dart';
import 'package:todo_2023/view.dart/screens/writing.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Writing()));
          },
          label: const Text("Create Notes")),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        leading: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => favorites()));
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 25,
              ))
        ],
        toolbarHeight: 100,
        title: const Text(
          "Notes App",
          style: TextStyle(
              fontSize: 29, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      // ignore: avoid_unnecessary_containers
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: SizedBox(
              height: 50,
              child: TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search your notes",
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: grid_notes == null
                ? Center(
                    child: Text(
                    "isempty",
                    style: TextStyle(color: Colors.white),
                  ))
                : grid_notes(),
          ),
        ],
      ),
    );
  }
}
