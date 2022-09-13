import 'package:day4/add_screen.dart';
import 'package:day4/to_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToDoScreen extends StatefulWidget {
  bool? value = false;

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ToDo>(builder: (context, value, child) {
      if (value.toDo!.isEmpty) {
        return Scaffold(
          body: Center(
            child: Text("Empty"),
          ),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.blue,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.list,
                          color: Colors.blue,
                        ),
                        backgroundColor: Colors.white,
                      ),
                      Text(
                        'ToDo Listy',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: value.toDo!.length,
                    itemBuilder:(context, index) =>  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('${value.toDo![index]}'),
                        Checkbox(
                            value: widget.value,
                            onChanged: (bool? value) {
                              setState(() {
                                widget.value = value;
                              });
                            })
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .push((MaterialPageRoute(builder: (context) => AddScreen())));
            },
            child: Icon(Icons.add),
          ),
        );
      }
    });
  }
}
