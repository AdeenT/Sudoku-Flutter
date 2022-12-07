import 'package:hive_flutter/hive_flutter.dart';

part'game_data_model.g.dart';

@HiveType(typeId: 1)
class GameDataModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String star;

  @HiveField(2)
  final String avatar;

  @HiveField(3)
  final String saveGame;

  GameDataModel({
    this.id,
    required this.star,
    required this.avatar,
    required this.saveGame,
  });
}
