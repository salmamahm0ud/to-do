
import 'package:day4/to_do.dart';
import 'package:day4/to_do_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ToDo(),
        ),
      ],
      child: MaterialApp(
        home: ToDoScreen(),
      ),
    );
  }
}
