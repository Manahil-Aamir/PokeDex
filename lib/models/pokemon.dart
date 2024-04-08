class Pokemon{
  int id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  int candyCount;
  String egg;
  double spawnChance;
  List<double> multipliers;
  double avgSpawns;
  String spawnTime;
  List<String> weaknesses;
  List<Evolution> nextEvolution;
  List<Evolution> prevEvolution;
  

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    required this.multipliers,
    required this.weaknesses,
    required this.nextEvolution,
    required this.prevEvolution,
  });

}

class Evolution{
  String num;
  String name;

  Evolution({
    required this.num,
    required this.name,
  });

   factory Evolution.fromJson(Map<String, dynamic> json) {
    return Evolution(
      num : json['num'],
      name : json['name'],
    );
  }
}