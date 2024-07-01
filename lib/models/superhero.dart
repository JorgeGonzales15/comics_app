class SuperHero {
  final String id;
  final String name;
  final String image;
  final String intelligence;


  const SuperHero(
      {required this.id,
      required this.name,
      required this.image,
      required this.intelligence});

  SuperHero.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        image = map["image"]["url"],
        intelligence = map["powerstats"]["intelligence"];

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "image": image, "intelligence": intelligence};
  }
}