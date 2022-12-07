// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameDataModelAdapter extends TypeAdapter<GameDataModel> {
  @override
  final int typeId = 1;

  @override
  GameDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameDataModel(
      id: fields[0] as int?,
      star: fields[1] as String,
      avatar: fields[2] as String,
      saveGame: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GameDataModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.star)
      ..writeByte(2)
      ..write(obj.avatar)
      ..writeByte(3)
      ..write(obj.saveGame);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
