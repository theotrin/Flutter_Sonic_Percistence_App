import 'package:flutter/material.dart';
import 'package:sonic_persistence_app/data/character_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.characterContext});

  final BuildContext characterContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController characterNameController = TextEditingController();
  TextEditingController characterTypeController = TextEditingController();
  TextEditingController characterUrlController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Adcionar Novo Personagem',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3, color: Colors.lightBlue)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira um nome para o personagem';
                        }
                        return null;
                      },
                      controller: characterNameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira um tipo para o personagem';
                        }
                        return null;
                      },
                      controller: characterTypeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Tipo do personagem',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor insira uma URL válida';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      controller: characterUrlController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Imagem (URL)',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.lightBlue),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: characterUrlController.text.isNotEmpty
                          ? Image.network(
                              characterUrlController.text,
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Image.asset(
                                  'assets/images/empty_image.png',
                                  fit: BoxFit.cover,
                                );
                              },
                            )
                          : Image.asset(
                              'assets/images/empty_image.png',
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        CharacterInherited.of(widget.characterContext)!
                            .addCharacter(
                                characterNameController.text,
                                characterTypeController.text,
                                characterUrlController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Salvando novo personagem...'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    style: const ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                      backgroundColor: WidgetStatePropertyAll(Colors.lightBlue),
                    ),
                    child: const Text(
                      'Adcionar!',
                    ),
                  ), //https://i.pinimg.com/1200x/9b/21/08/9b2108ae48a97e48efaa2bafb0b79b28.jpg
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
