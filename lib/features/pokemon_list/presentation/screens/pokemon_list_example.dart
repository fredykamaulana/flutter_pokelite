import 'package:flutter/material.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pokemons = [
      {
        "name": "Bulbasaur",
        "id": "#001",
        "type": ["Grass", "Poison"],
        "color": Colors.green.shade300,
        "image":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
      },
      {
        "name": "Ivysaur",
        "id": "#002",
        "type": ["Grass", "Poison"],
        "color": Colors.green.shade400,
        "image":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png",
      },
      {
        "name": "Venusaur",
        "id": "#003",
        "type": ["Grass", "Poison"],
        "color": Colors.green.shade500,
        "image":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png",
      },
      {
        "name": "Charmander",
        "id": "#004",
        "type": ["Fire"],
        "color": Colors.red.shade300,
        "image":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png",
      },
      {
        "name": "Charmeleon",
        "id": "#005",
        "type": ["Fire"],
        "color": Colors.red.shade400,
        "image":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png",
      },
      {
        "name": "Charizard",
        "id": "#006",
        "type": ["Fire", "Flying"],
        "color": Colors.red.shade500,
        "image":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png",
      },
      {
        "name": "Squirtle",
        "id": "#007",
        "type": ["Water"],
        "color": Colors.blue.shade300,
        "image":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png",
      },
      {
        "name": "Wartortle",
        "id": "#008",
        "type": ["Water"],
        "color": Colors.blue.shade400,
        "image":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/8.png",
      },
      {
        "name": "Blastoise",
        "id": "#009",
        "type": ["Water"],
        "color": Colors.blue.shade500,
        "image":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png",
      },
      {
        "name": "Pikachu",
        "id": "#010",
        "type": ["Electric"],
        "color": Colors.yellow.shade300,
        "image":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.arrow_back, size: 28),
                  Text(
                    "Pokedex",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.grid_view, size: 28),
                ],
              ),
            ),

            // GRID OF POKEMON CARDS
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: pokemons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (context, index) {
                  final pokemon = pokemons[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: pokemon["color"],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        // Pokemon Image
                        Positioned(
                          right: 8,
                          bottom: 8,
                          child: Image.network(
                            pokemon["image"],
                            height: 100,
                            colorBlendMode: BlendMode.darken,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Name + ID + Types
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pokemon["name"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                pokemon["id"],
                                style: const TextStyle(color: Colors.white70),
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 4,
                                children: (pokemon["type"] as List<String>)
                                    .map(
                                      (t) => Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Text(
                                          t,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade600,
        onPressed: () {},
        child: const Icon(Icons.filter_alt),
      ),
    );
  }
}
