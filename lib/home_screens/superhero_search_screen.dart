import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_comics_app/home_screens/widget/search_bar.dart';
import 'package:super_comics_app/home_screens/widget/superhero_list.dart';
import 'package:super_comics_app/models/superhero.dart';
import 'package:super_comics_app/services/superhero_Service.dart';

class SuperheroesScreen extends StatefulWidget {
  const SuperheroesScreen({super.key});

  @override
  State<SuperheroesScreen> createState() => _SuperheroesScreenState();
}

class _SuperheroesScreenState extends State<SuperheroesScreen> {
  List<SuperHero> superheroes = [];
  final HeroService superheroService = HeroService();
  int heroesCount = 0;

  Future<void> fetchHeroes(String value) async {
    if (value.isEmpty) {
      return;
    }

    try {
      List<SuperHero> result =
          await superheroService.getHeroByName(value) as List<SuperHero>;
      setState(() {
        superheroes = result;
        // Actualizar heroesCount dentro de setState para asegurar la sincronización
        heroesCount = result.length;
      });
      print("Heroes fetched: ${superheroes.length}");

      // Guardar la cantidad de elementos en shared_preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('heroes_count', superheroes.length);
    } catch (e) {
      print("Error fetching heroes: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Superheroes'),
      ),
      body: Center(
        child: Column(
          children: [
            CustomSearchBar(
              callback: (value) {
                fetchHeroes(value);
              },
            ),
            const SizedBox(height: 20),
            Text('Number of results: $heroesCount'),
            const SizedBox(height: 15),
            Expanded(child: SuperheroList(superheroes: superheroes))
          ],
        ),
      ),
    );
  }
}