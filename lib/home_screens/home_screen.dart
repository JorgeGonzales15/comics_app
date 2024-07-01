import 'package:flutter/material.dart';
import 'package:super_comics_app/home_screens/superhero_search_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Acción para el primer botón
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SuperheroesScreen()));
              },
              child: const Text('Button 1'),
            ),
            const SizedBox(height: 20), // Espaciado entre los botones
            ElevatedButton(
              onPressed: () {
                // Acción para el segundo botón
                
              },
              child: const Text('Button 2'),
            ),
          ],
        ),
      ),
    );
  }
}