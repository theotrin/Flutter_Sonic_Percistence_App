import 'package:flutter/material.dart';
import 'package:sonic_persistence_app/data/character_inherited.dart';
import 'package:sonic_persistence_app/screens/character_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home:  CharacterInherited(child: CharacterScreen()));
  }
}//https://i.pinimg.com/474x/63/72/7b/63727b3989884bc602f9d4db236fc8c0.jpg
