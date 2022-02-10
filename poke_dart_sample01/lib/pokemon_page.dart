import 'package:flutter/material.dart';
import 'package:pokeapi_dart/pokeapi_dart.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final PokeApi api = PokeApi();
  Pokemon? _pokemon;
  final textEditingController = TextEditingController();
  _fetchPokemonById(int id) async {
    api.pokemon
        .get(id: id)
        .then((value) => {
              setState(() {
                _pokemon = value;
              })
            })
        .catchError((error) => {print("error: " + error)});
  }

  _onPressedAddButton() {
    if (textEditingController.text.isEmpty) return;
    _fetchPokemonById(int.parse(textEditingController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'input here Pokemon id...',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: const Text("Search!!!"),
                  onPressed: () => _onPressedAddButton(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  _pokemon?.sprites.backDefault ?? "",
                  errorBuilder: (context, error, stackTrace) => Container(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(_pokemon?.name ?? ""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
