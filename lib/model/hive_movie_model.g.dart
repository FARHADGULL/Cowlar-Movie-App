// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveMovieModelAdapter extends TypeAdapter<HiveMovieModel> {
  @override
  final int typeId = 0;

  @override
  HiveMovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveMovieModel(
      id: fields[0] as int,
      title: fields[1] as String,
      backDrop: fields[2] as String,
      poster: fields[3] as String,
      overview: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveMovieModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.backDrop)
      ..writeByte(3)
      ..write(obj.poster)
      ..writeByte(4)
      ..write(obj.overview);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveMovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
