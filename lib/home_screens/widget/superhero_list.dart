import 'package:flutter/material.dart';
import 'package:super_comics_app/home_screens/widget/superhero_card.dart';
import 'package:super_comics_app/models/superhero.dart';


class SuperheroList extends StatelessWidget {
  const SuperheroList({super.key, required this.superheroes});
  final List<SuperHero> superheroes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: superheroes.length,
        itemBuilder: (context, index) {
          return SuperheroCard(superhero: superheroes[index]);
        });
  }
}