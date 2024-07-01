import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:super_comics_app/models/superhero.dart';

class HeroService {
  final String _baseUrl = 'https://superheroapi.com/api/10157703717092094';

  Future<List> getHeroByName(String name) async {
    final response = await http.get(Uri.parse('$_baseUrl/search/$name'));
    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      List maps = jsonResponse['results'];
      return maps.map((map) =>SuperHero.fromJson(map)).toList();
    } 
    return [];
  }


}