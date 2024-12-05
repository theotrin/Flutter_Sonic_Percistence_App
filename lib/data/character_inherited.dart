import 'package:flutter/material.dart';
import 'package:sonic_persistence_app/components/character.dart';

class CharacterInherited extends InheritedWidget  {
  CharacterInherited({super.key, required this.child}) : super(child: child);

  final List<Character> characterList =  [
    Character('Sonic', 'Velocidade', 'assets/images/sonic.jpg'),
    Character("Shadow", "Velocidade", "assets/images/shadow.jpg"),
    Character("Amy", "Força", "assets/images/amy.jpg"),
    Character("Tails", "Voador", "assets/images/tails.jpg"),
    Character("Blaze", "Voador", "assets/images/blaze.webp"),
    Character("Jet", "Velocidade", "assets/images/jet.png"),
  ];

  void addCharacter(String name, String type, String photo) {
    characterList.add(Character(name, type, photo));
  }

  final Widget child;

  static CharacterInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CharacterInherited>();
  }

  @override
  bool updateShouldNotify(CharacterInherited oldWidget) {
    return oldWidget.characterList.length != characterList.length;
  }
}
