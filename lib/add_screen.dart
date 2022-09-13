import 'package:day4/to_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _text;

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
          appBar: AppBar(title: Text('add a to do')),
          body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Add a To do'),
                  onChanged: (text){
                    setState(() {
                      _text=text;

                    });
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Text is empty';
                    }
                    return null;
                  },
                ),

                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        value.addtoToDo(_text!);
                        Navigator.of(context)
                            .pop((MaterialPageRoute(builder: (context) => AddScreen())));
                        print(value.toDo!.length);
                      }
                    },
                    child: Text('add'))
              ],
            ),
          ),
        );
      }
    });
  }
}
