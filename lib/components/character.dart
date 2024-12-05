import 'package:flutter/material.dart';

class Character extends StatefulWidget {
  final String name;
  final String type;
  final String imgUrl;

  const Character(this.name, this.type, this.imgUrl, {Key? key})
      : super(key: key);

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  int speedPoints = 100;

  bool assertOrNetwork() {
    if (widget.imgUrl.contains('http')) {
      return false;
    }
    return true;
  }

  void incrementSpeed() {
    setState(() {
      speedPoints += 10;
    });
  }

  void decrementSpeed() {
    setState(() {
      if (speedPoints > 0) {
        speedPoints -= 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9), color: Colors.blue),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            child: assertOrNetwork()
                                ? SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: Image.asset(
                                      widget.imgUrl,
                                      fit: BoxFit.cover,
                                      excludeFromSemantics: true,
                                    ))
                                : Image.network(
                                    widget.imgUrl,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nome: ${widget.name}',
                                  style: const TextStyle(fontSize: 22),
                                ),
                                Text(
                                  'Tipo: ${widget.type}',
                                  style: const TextStyle(fontSize: 22),
                                ),
                                Text(
                                  'Velocidade: $speedPoints',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          FloatingActionButton(
                            heroTag: null,
                            onPressed: decrementSpeed,
                            tooltip: 'Diminuir Velocidade',
                            child: const Icon(Icons.remove),
                          ),
                          const SizedBox(width: 8),
                          FloatingActionButton(
                            heroTag: null,
                            onPressed: incrementSpeed,
                            tooltip: 'Aumentar Velocidade',
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
