import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemonprovider.dart';
import 'package:pokedex/screens/pokemonall.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (context) => PokemonProvider(),
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const PokemonAll(),
    ),
    );
  }
}