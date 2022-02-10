import 'package:flutter/material.dart';
import 'package:poke_dart_sample01/pokemon_page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("pokedart sample app"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const PokemonPage();
                  }),
                );
              },
              child: const Text('get pokemon by id'),
            ),
          ),
        ],
      ),
    );
  }
}
