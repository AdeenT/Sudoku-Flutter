import 'package:hive_flutter/hive_flutter.dart';
part'game_data_model.g.dart';

@HiveType(typeId: 0)
class GameDataModel extends HiveObject {
  @HiveField(0)
  final String star;

  @HiveField(1)
  final String avatar;

  @HiveField(2)
  final String saveGame;

  GameDataModel({
    required this.star,
    required this.avatar,
    required this.saveGame,
  });
}
