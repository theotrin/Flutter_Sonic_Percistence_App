import 'package:flutter/material.dart';
import 'package:sonic_persistence_app/data/character_inherited.dart';
import 'package:sonic_persistence_app/screens/form_screen.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Personagens Sonic'),
          leading: const Icon(Icons.add_task),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 70),
          children: CharacterInherited.of(context)!.characterList,
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => FormScreen(characterContext: context),
              ),
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}
