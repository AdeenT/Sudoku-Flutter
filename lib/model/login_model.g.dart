// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginModelAdapter extends TypeAdapter<LoginModel> {
  @override
  final int typeId = 1;

  @override
  LoginModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginModel(
      username: fields[1] as String,
      password: fields[2] as String,
      leaderboard: fields[3] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, LoginModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.leaderboard);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
