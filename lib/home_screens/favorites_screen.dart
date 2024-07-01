import 'package:flutter/material.dart';
import 'package:super_comics_app/dao/hero_dao.dart';


class FavoritesScreen extends StatelessWidget {

  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     body: FavoriteList(),
    );
  }
 
}

class FavoriteList extends StatefulWidget {
  const FavoriteList({super.key});

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  List _favorites = [];
  final SuperheroDao _packageDao = SuperheroDao();

  fetchFavorites() async {
    _favorites = await _packageDao.fetchAll();
    if (mounted) {
      setState(() {
        _favorites = _favorites;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchFavorites();
    return ListView.builder(
      itemCount: _favorites.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(_favorites[index].name),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {

          },
        ),
      ),
    );
  }}