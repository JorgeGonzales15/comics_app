import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:super_comics_app/models/superhero.dart' as sh;


class SuperheroCard extends StatefulWidget {
  const SuperheroCard({
    super.key,
    required this.superhero,
  });

  final sh.SuperHero superhero;

  @override
  State<SuperheroCard> createState() => _SuperheroCardState();
}

class _SuperheroCardState extends State<SuperheroCard> {
  bool _isFavorite = false;

  initialize() async {
    //_isFavorite = await SuperheroDao().isFavorite(widget.superhero);

    if (mounted) {
      setState(() {
        _isFavorite = _isFavorite;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(widget.superhero.image),
        title: Text(widget.superhero.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Intelligence: ${widget.superhero.intelligence}')
          ],
        ),
        trailing: IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              if (mounted) {
                setState(() {
                  _isFavorite = !_isFavorite;
                  //_isFavorite
                      //? SuperheroDao().insert(widget.superhero)
                      //: SuperheroDao().delete(widget.superhero);
                });
              }
            }),
      ),
    );
  }
}