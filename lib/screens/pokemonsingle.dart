import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

import '../pokemoncolours.dart';

class PokemonSingle extends StatefulWidget {
  const PokemonSingle({super.key, required this.pokemon,});

  final Pokemon pokemon;
  @override
  State<PokemonSingle> createState() => _PokemonSingleState();
}

Widget titleText(String title){
  return Column(
    children: [
      Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
      const SizedBox(height: 13),
    ],
  );
}

Widget infoText(String value){
  return Column(
    children: [
      Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
      const SizedBox(height: 13),
    ],
  );
}

Widget details(String title, String value) {
  return Row(
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.grey[600],
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ),
      const SizedBox(width: 90),
      Text(
        value,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ),
    ],
  );
}


class _PokemonSingleState extends State<PokemonSingle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PokemonColours.getColorForType(widget.pokemon.type[0]),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white, // Comma was added here
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: PokemonColours.getColorForType(widget.pokemon.type[0]),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: Stack(
          children: [
              Positioned(
                bottom: 0,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                ), 
                color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(27, 80, 0, 0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            titleText('Name'),
                            titleText('Height'),
                            titleText('Weight'),
                            titleText('Spawn Time'),
                            titleText('Weakness'),
                            titleText('Pre Evolution'),
                            titleText('Next Evolution'),
                          ],
                        ),
                        const SizedBox(width: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            infoText(widget.pokemon.name),
                            infoText(widget.pokemon.height),
                            infoText(widget.pokemon.weight),
                            infoText(widget.pokemon.spawnTime),
                            infoText(widget.pokemon.weaknesses.join(', ')),
                            infoText(widget.pokemon.prevEvolution.isNotEmpty? widget.pokemon.prevEvolution.map((e) => e.name).join(' ') : 'Just Hatched'),
                            infoText(widget.pokemon.nextEvolution.isNotEmpty ? widget.pokemon.nextEvolution.map((e) => e.name).join(' ') : 'Maxed Out'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20 ,0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                        widget.pokemon.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w800
                        )
                      ),
                      const Spacer(),
                      Text(
                        '#${widget.pokemon.num}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        )
                      ),
                      ]
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent.withOpacity(0.25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 7, 5, 7),
                            child: Text(
                              widget.pokemon.type.join(', '),
                            style: const TextStyle(
                              color: Colors.white,
                            ),),
                            )
                        )
                      ],
                    ),
                    //const SizedBox(height: 40),
                    SizedBox(
                      height: 250,
                      width: 250,
                      child: Hero(tag: '${widget.pokemon.id}image', 
                      child: Expanded(
                        child: CachedNetworkImage(
                          imageUrl: widget.pokemon.img,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                      ),
                      ),
                    )
                  ]
                ),
              ),
            
          ],
        ),
      ),
    );
  }
  
}