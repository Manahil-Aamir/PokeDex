import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemonprovider.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/pokemoncolours.dart';
import 'package:cached_network_image/cached_network_image.dart';


class PokemonAll extends StatefulWidget {
  const PokemonAll({super.key,});

  @override
  State<PokemonAll> createState() => _PokemonAllState();
}

class _PokemonAllState extends State<PokemonAll> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<PokemonProvider>(context, listen: false).getAllPokemons();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Provider App"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 3, 8),
        child: Consumer<PokemonProvider>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            final pokemons = value.pokemons;
            return GridView.builder(
              itemCount: pokemons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: 6.5/4.5,
              ),
              itemBuilder: (context, index) {
                final pokemon = pokemons[index];
                return Card(
                  color: PokemonColours.getColorForType(pokemon.type[0]),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CachedNetworkImage(
                        imageUrl: pokemon.img,
                        height: 100,
                        width: 100,
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(width: 60.0,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            Text(
                              pokemon.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                fontSize: 19,
                              ),
                            ),
                            Container(
                              decoration: ShapeDecoration(
                                color: Colors.transparent.withOpacity(0.43),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(9, 5, 9, 5),
                                child: Text(
                                  pokemon.type[0],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
